# Django personal portfolio website

This is a Python Django-based personal portfolio website.

The website uses [Wagtail CMS](https://github.com/wagtail/wagtail). Wagtail is a Django Content Management System.

All content: personal information, portfolio projects, social media links, Google Analytics tracking code, etc. can be
adjusted in Wagtail admin.

## Local development

Setup local environment for the development process.

Go to `./portfolio` directory and activate virtual environment.

#### Run in a terminal

```shell
pip install -r requirements.txt
python manage.py migrate
python manage.py createsuperuser
python manage.py runserver
```

Go to `http://127.0.0.1:8000/admin/` in your browser to the Wagtail CMS admin to populate it with your data and to
configure homepage.

## Production deployment
