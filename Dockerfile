# Use an official Python runtime as a parent image
FROM python:3.9-slim
RUN apt-get update && apt-get install -y \
    libncurses5-dev \
    libncursesw5-dev \
    locales

# Generate locale
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8

# Set the locale environment variables
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Set the working directory in the container
WORKDIR /

# Copy the requirements file into the container
COPY dependencies.txt .

# Install any needed packages specified in dependencies.txt
RUN pip install --no-cache-dir -r dependencies.txt

# Copy the rest of the application code into the container
COPY 3pub.py .

# Set the default command to run the application
CMD ["python", "3pub.py", "ebook.epub"]

