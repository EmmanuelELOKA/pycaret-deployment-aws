FROM python:3.7

RUN pip install virtualenv
ENV VIRTUAL_ENV=/venv
RUN virtualenv venv -p python3
ENV PATH="VIRTUAL_ENV/bin:$PATH"

WORKDIR /app
ADD . /app

# Install dependencies
RUN pip install -r requirements.txt

# Expose port 
EXPOSE 5000

# Health check
HEALTHCHECK --interval=30s --timeout=3s CMD curl -f http://localhost:5000/ || exit 1

# Run the application
CMD ["python", "app.py"]