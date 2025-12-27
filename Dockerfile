# Use Python 3.10
FROM python:3.10-slim

# Set working directory to /code
WORKDIR /code

# Copy requirements
COPY ./requirements.txt /code/requirements.txt

# Install dependencies
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# Copy the source code
COPY ./src /code/src

# Create a writable directory for caching/temp files if needed
RUN mkdir -p /code/temp && chmod 777 /code/temp
RUN mkdir -p /tmp && chmod 777 /tmp

# Expose port (Hugging Face Spaces uses 7860)
EXPOSE 7860

# Set environment variable
ENV PORT=7860

# Run the Flask application with gunicorn
CMD ["gunicorn", "src.app:app", "--bind", "0.0.0.0:7860", "--timeout", "120", "--workers", "1"]