# Netly

## 1. Project Overview
Netly is a full-stack application for managing your investment portfolio, supporting asset types like equity, cash, real estate, gold, debt, mutual funds, cryptocurrency, bonds, and more. It features an interactive dashboard, real-time calculations, CRUD operations, filtering, search, and a responsive design. The backend and frontend are deployed separately: Spring Boot serves the API and Angular is built and served as static files.

## 2. Prerequisites
- Java 25 or higher
- Maven 3.6+
- Node.js and npm
- PostgreSQL 17+

## 3. Tools Used
- **Spring Boot** (Backend framework)
- **Angular** (Frontend framework)
- **Maven** (Build tool)
- **PostgreSQL** (Database)

## 4. Tech Stack
- **Backend:** Java 25, Spring Boot 3+, PostgreSQL
- **Frontend:** Angular 21, TypeScript
- **Build:** Maven for backend, npm for frontend

## 5. Local Development
### Step 1: Create Database
```bash
psql -U postgres -c "CREATE DATABASE netly_app;"
```

### Step 2: Run the backend
```bash
mvn spring-boot:run
```

The backend API runs on `http://localhost:8082`.

### Step 3: Run the frontend
```bash
cd ui
npm install
npm start
```

The Angular dev server runs on `http://localhost:4200` and proxies `/api` requests to the backend.

## 6. Separate Builds
### Backend build
```bash
mvn clean package
```

This produces only the backend jar in `target/`. It does not build or embed the Angular application.

### Frontend build
```bash
cd ui
npm install
npm run build -- --configuration production
```

This produces the frontend assets in `ui/dist/netly-frontend/browser/`.

Production frontend builds call `https://api.netly.upvaly.com/api`.

## 7. Configuration
- **Database password:** Edit `netly/src/main/resources/application.properties`:
  ```properties
  spring.datasource.password=YOUR_SECURE_PASSWORD
  ```
- **Change port:**
  ```properties
  server.port=9090
  ```
  Then access at: http://localhost:9090

- **Run as background service:**
  ```bash
  nohup java -jar netly-x.x.x.jar > app.log 2>&1 &
  ```

## 8. Using the Application
- **Dashboard:** View total portfolio value, gain/loss, asset allocation, and breakdown by type.
- **Add Asset:** Use "Add New Asset" to input details for stocks, real estate, gold, etc.
- **Add Liabilities:** Use "Add New Liability" to input details for Home Loans, Car Loans, Personal Loans etc.
- **View/Edit/Delete Assets:** Use "My Assets" to manage your Assets.
- **View/Edit/Delete Liability:** Use "My Liabilities" to manage your Liabilities.
- **Track Performance:** Dashboard auto-calculates gain/loss and allocation.

## 9. Production Deployment Guide

This guide deploys the backend and frontend separately.

### Prerequisites

- Ubuntu/Debian-based server with sudo access
- Java installed (for running the Spring Boot application)
- Node.js/npm available on the build machine for the frontend build
- Nginx installed
- Certbot for SSL certificates
- Database server (PostgreSQL) configured

### Deployment Steps

1. **Build the backend jar:**
   ```bash
   mvn clean package
   ```

2. **Build the frontend dist:**
   ```bash
   cd ui
   npm install
   npm run build -- --configuration production
   ```

3. **Navigate to the deployment directory:**
   ```bash
   cd /opt
   ```

4. **Create application directories:**
   ```bash
   mkdir app
   cd app
   mkdir netly
   cd netly
   mkdir config
   ```

5. **Copy backend files:**
   - Copy `target/netly-2.0.0.jar` to `/opt/app/netly/`

6. **Copy configuration files:**
   - Copy your application configuration files (e.g., `application-prod.properties`) to the `/opt/app/netly/config/` directory.

7. **Copy frontend files:**
   - Copy the contents of `ui/dist/netly-frontend/browser/` to a static web root such as `/var/www/netly/`

8. **Execute database scripts:**
   - Run the database schema scripts (e.g., `schema.sql`) to set up the database.

9. **Copy systemd service file:**
   - Copy the `netly-app.service` file to `/etc/systemd/system/`.

10. **Enable and reload systemd:**
   ```bash
   sudo systemctl enable netly-app
   sudo systemctl daemon-reload
   ```

11. **Copy Nginx configuration file:**
   - Copy the `netly.upvaly.com` file to `/etc/nginx/sites-available/`.

12. **Obtain SSL certificates:**
   ```bash
   sudo certbot --nginx -d netly.upvaly.com -d api.netly.upvaly.com
   ```

13. **Enable Nginx site:**
   ```bash
   sudo cp /etc/nginx/sites-available/netly.upvaly.com /etc/nginx/sites-available/netly.upvaly.com
   cd /etc/nginx/sites-enabled
   sudo ln -sf /etc/nginx/sites-available/netly.upvaly.com netly.upvaly.com
   ```

The UI is served from `https://netly.upvaly.com` and the backend API is served from `https://api.netly.upvaly.com`.

14. **Restart services:**
    - Start the Netly application: `sudo systemctl start netly-app`
    - Restart Nginx: `sudo systemctl restart nginx`

### Notes

- Ensure all file paths and permissions are correctly set.
- Update configuration files with production-specific settings (database URLs, secrets, etc.).
- Monitor logs in `/opt/app/netly/logs/` for any issues.

## 10. Troubleshooting & FAQ
- **Database connection error:**
  - Ensure PostgreSQL is running and the database exists.
- **Frontend not loading:**
  - Rebuild the frontend: `cd ui && npm run build -- --configuration production`
- **Build fails at npm install:**
  - Clean the frontend dependencies and rerun `npm install`.
- **Do I need Node.js?** Yes, the frontend is built separately with npm.
- **Can I run frontend separately?** Yes: `cd ui && npm start`
- **How do I update the frontend?** Rebuild `ui/dist/...` and redeploy the static files on the server.
---
