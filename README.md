# Payroll Management System

A comprehensive web-based payroll management system built with PHP, MySQL, and Bootstrap. This system provides complete payroll processing capabilities including employee management, attendance tracking, salary calculations, and payslip generation.

## 🚀 Features

### Core Functionality

- **Employee Management**: Add, edit, and manage employee information
- **Department & Position Management**: Organize employees by departments and positions
- **Attendance Tracking**: Monitor employee time logs (AM/PM in/out)
- **Salary Management**: Configure base salaries and compensation structures
- **Allowances & Deductions**: Set up various types of allowances and deductions
- **Payroll Processing**: Automated payroll calculation and generation
- **Payslip Generation**: Generate and print detailed payslips
- **User Management**: Multi-level user access control

### Technical Features

- **Responsive Design**: Mobile-friendly Bootstrap interface
- **Real-time Updates**: AJAX-powered dynamic content
- **Data Export**: Export payroll data and reports
- **Print Functionality**: Print payslips and reports
- **Session Management**: Secure login/logout system

## 📋 Requirements

- **Web Server**: Apache/Nginx
- **PHP**: 7.4 or higher
- **MySQL**: 5.7 or higher
- **Browser**: Modern web browser with JavaScript enabled

## 🛠️ Installation

### 1. Clone the Repository

```bash
git clone https://github.com/abdilamu/payroll-management-system.git
cd payroll-management-system
```

### 2. Database Setup

1. Create a MySQL database named `payroll`
2. Import the database schema:
   ```bash
   mysql -u root -p payroll < database/payroll.sql
   ```

### 3. Configuration

1. Update database connection in `db_connect.php`:
   ```php
   $conn = new mysqli('localhost', 'username', 'password', 'payroll');
   ```

### 4. Web Server Setup

1. Place the project in your web server directory (e.g., `htdocs/` for XAMPP)
2. Ensure the web server has read/write permissions

### 5. Access the System

- Navigate to `http://localhost/payroll/`
- Default login credentials:
  - **Username**: admin
  - **Password**: admin123

## 📁 Project Structure

```
payroll/
├── assets/                 # Static assets (CSS, JS, images)
│   ├── css/               # Stylesheets
│   ├── js/                # JavaScript files
│   ├── img/               # Images
│   └── vendor/            # Third-party libraries
├── database/              # Database files
│   └── payroll.sql        # Database schema
├── admin_class.php        # Main business logic class
├── ajax.php              # AJAX request handler
├── db_connect.php        # Database connection
├── index.php             # Main application entry point
├── login.php             # Authentication page
└── [other PHP files]     # Feature-specific pages
```

## 🗄️ Database Schema

### Core Tables

- **users**: System users and authentication
- **employee**: Employee information and details
- **department**: Company departments
- **position**: Job positions and roles
- **attendance**: Employee time logs
- **allowances**: Allowance types and configurations
- **deductions**: Deduction types and configurations
- **payroll**: Payroll periods and calculations
- **payroll_items**: Individual payroll entries

## 👥 User Roles

1. **Administrator**: Full system access

   - Manage all employees, departments, positions
   - Configure allowances and deductions
   - Process payroll and generate reports
   - Manage system settings

2. **HR Manager**: Employee and payroll management

   - Add/edit employee information
   - Manage attendance records
   - Process payroll calculations

3. **Employee**: Limited access
   - View personal information
   - Check attendance records
   - Access payslips

## 💼 Key Features Explained

### Employee Management

- Add new employees with unique employee numbers
- Assign departments and positions
- Set base salary and compensation structure
- Track employee information and history

### Attendance System

- Four types of time logs: AM IN, AM OUT, PM IN, PM OUT
- Automatic date/time tracking
- Attendance history and reports

### Payroll Processing

- Support for monthly and semi-monthly payroll
- Automatic calculation of:
  - Base salary
  - Allowances (monthly, semi-monthly, one-time)
  - Deductions (monthly, semi-monthly, one-time)
  - Net pay calculation
- Payroll period management
- Bulk payroll processing

### Allowances & Deductions

- Flexible allowance/deduction types
- Multiple frequency options (monthly, semi-monthly, one-time)
- Effective date management
- Individual employee assignments

## 🔧 Configuration

### System Settings

- Company information and branding
- Contact details
- System preferences

### Database Configuration

- Update connection parameters in `db_connect.php`
- Ensure proper database permissions

## 📊 Reports & Export

- Employee lists and details
- Attendance reports
- Payroll summaries
- Payslip generation
- Data export capabilities

## 🔒 Security Features

- Session-based authentication
- Password protection
- Role-based access control
- SQL injection prevention
- XSS protection

## 🚀 Usage

1. **Login**: Access the system with valid credentials
2. **Employee Setup**: Add employees, departments, and positions
3. **Attendance**: Record daily employee time logs
4. **Payroll Setup**: Configure allowances and deductions
5. **Process Payroll**: Generate payroll for specified periods
6. **Generate Reports**: Create payslips and reports

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

## 🆘 Support

For support and questions:

- Create an issue on GitHub
- Contact the development team
- Check the documentation

## 🔄 Version History

- **v1.0**: Initial release with core payroll functionality
- **v1.1**: Enhanced attendance tracking
- **v1.2**: Improved user interface and reporting

---

**Note**: This system is designed for educational and small to medium business use. For production deployment, ensure proper security measures and data backup procedures are in place.
