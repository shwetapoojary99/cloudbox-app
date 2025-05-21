# Use a lightweight Nginx base image
FROM nginx:alpine

# Copy your HTML file into the web server directory
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
