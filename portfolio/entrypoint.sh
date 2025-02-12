#!/bin/bash

# Apply database migrations
echo "Applying database migrations..."
python manage.py makemigrations --no-input
python manage.py migrate --no-input

# Create superuser if it doesn't exist
echo "Creating superuser..."
python manage.py shell <<EOF
from django.contrib.auth import get_user_model
import os

User = get_user_model()
username = os.getenv("DJANGO_SUPERUSER_USERNAME", "admin")
email = os.getenv("DJANGO_SUPERUSER_EMAIL", "admin@wagtail.com")
password = os.getenv("DJANGO_SUPERUSER_PASSWORD", "admin123")

if not User.objects.filter(username=username).exists():
    User.objects.create_superuser(username=username, email=email, password=password)
    print("Superuser created successfully.")
else:
    print("Superuser already exists.")
EOF

# Start Gunicorn server
echo "Starting Gunicorn..."
exec gunicorn portfolio.wsgi:application --bind 0.0.0.0:8000