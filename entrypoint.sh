#!/bin/bash
python manage.py migrate                  # Apply database migrations
python manage.py collectstatic --noinput  # Collect static files

# Prepare log files and start outputting logs to stdout
#touch gunicorn.log
#touch access.log
#tail -n 0 -f logs/*.log &

# Start Gunicorn processes
echo Starting Gunicorn.
exec gunicorn startwebsite.wsgi:application \
    --name startwebsite_django \
    --bind 0.0.0.0:8000 \
    --workers 3 \
 #   --log-level=info \
 #   --log-file=gunicorn.log \
 #   --access-logfile=access.log \
 #   "$@"
