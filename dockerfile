FROM python:3.9

# Set the working directory
WORKDIR /code

# Copy requirements.txt to the container
COPY ./requirements.txt /code/requirements.txt

# Install dependencies from requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# Copy the application code to the container
COPY ./app /code/app

# Expose port 80 for the application
EXPOSE 80

# Command to run the FastAPI app using Uvicorn
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]
