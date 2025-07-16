#!/bin/bash

DEFAULT_DB_NAME="workforce"
MANAGE_PY_PATH="./manage.py"
DUMP_FILE_BASE_DIR="$HOME/dev/workforce/var"

DUMP_FILE=""
DB_NAME="$DEFAULT_DB_NAME"

usage() {
  echo "Usage: $0 --dump <dump_file_name> [--db <database_name>]"
  echo ""
  echo "Arguments:"
  echo "  --dump <dump_file_name> : REQUIRED. The name of the dump file (e.g., 'develop')."
  echo "                                   Assumes dump file is located in '$DUMP_FILE_BASE_DIR/<dump_file_name>.dump'"
  echo "  --db <database_name>         : OPTIONAL. The name of the database to operate on."
  echo "                                   Defaults to '$DEFAULT_DB_NAME' if not provided."
  echo ""
  echo "Example:"
  echo "  $0 --dump develop --db my_project_db"
  echo "  $0 --dump develop # Uses default database 'workforce'"
  exit 1
}

# Parse command-line arguments
while (( "$#" )); do
  case "$1" in
    --dump)
      if [ -n "$2" ] && [ "${2:0:1}" != "-" ]; then
        DUMP_FILE="$2"
        shift 2
      else
        echo "Error: --dump requires a value." >&2
        usage
      fi
      ;;
    --db)
      if [ -n "$2" ] && [ "${2:0:1}" != "-" ]; then
        DB_NAME="$2"
        shift 2
      else
        echo "Error: --db requires a value." >&2
        usage
      fi
      ;;
    *) # Unknown option
      echo "Error: Unknown argument '$1'" >&2
      usage
      ;;
  esac
done

# --- Validation ---

if [ -z "$DUMP_FILE" ]; then
  echo "Error: --dump is a required argument." >&2
  usage
fi

FULL_DUMP_PATH="${DUMP_FILE_BASE_DIR}/${DUMP_FILE}.dump"

if [ ! -f "$FULL_DUMP_PATH" ]; then
  echo "Error: Dump file not found at '$FULL_DUMP_PATH'." >&2
  exit 1
fi

if [ -z "$USER" ]; then
  echo "Error: The \$USER environment variable is not set. Please ensure it's set for psql." >&2
  exit 1
fi

# --- Database Operations ---

echo "--- Starting database operations for '$DB_NAME' with dump file '$FULL_DUMP_PATH' ---"

# 1. Drop the database
echo "Attempting to drop database '$DB_NAME'..."
if dropdb "$DB_NAME"; then
  echo "Database '$DB_NAME' dropped successfully."
else
  echo "Warning: Could not drop database '$DB_NAME'. It might not exist or you lack permissions."
  exit 1
fi

# 2. Create the database
echo "Creating database '$DB_NAME'..."
if createdb "$DB_NAME"; then
  echo "Database '$DB_NAME' created successfully."
else
  echo "Error: Failed to create database '$DB_NAME'. Exiting." >&2
  exit 1
fi

# 3. Restore the database from the dump file
echo "Restoring database '$DB_NAME' from '$FULL_DUMP_PATH'..."
if psql --username="$USER" "$DB_NAME" < "$FULL_DUMP_PATH"; then
  echo "Database '$DB_NAME' restored successfully."
else
  echo "Error: Failed to restore database '$DB_NAME' from '$FULL_DUMP_PATH'. Exiting." >&2
  exit 1
fi

# 4. Run Django migrations
echo "Running Django migrations..."
if python "$MANAGE_PY_PATH" migrate; then
  echo "Django migrations completed successfully."
else
  echo "Error: Failed to run Django migrations. Please check your Django project setup." >&2
  exit 1
fi

echo "--- Database operations and migrations completed successfully for '$DB_NAME' ---"
