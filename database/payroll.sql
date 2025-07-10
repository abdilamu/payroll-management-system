-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2021 at 09:38 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `payroll`
--

-- --------------------------------------------------------

--
-- Table structure for table `allowances`
--

CREATE TABLE `allowances` (
  `id` int(30) NOT NULL,
  `allowance` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `allowances`
--

INSERT INTO `allowances` (`id`, `allowance`, `description`) VALUES
(1, 'Sample', 'Sample Allowance'),
(2, 'Phone', 'Phone Allowance'),
(3, 'Rice', 'Rice Allowance'),
(4, 'House', 'House Allowance');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `employee_id` int(20) NOT NULL,
  `log_type` tinyint(1) NOT NULL COMMENT '1 = AM IN,2 = AM out, 3= PM IN, 4= PM out\r\n',
  `datetime_log` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `employee_id`, `log_type`, `datetime_log`, `date_updated`) VALUES
(10, 9, 1, '2020-09-16 08:00:00', '2020-09-29 16:16:57'),
(11, 9, 2, '2020-09-16 12:00:00', '2020-09-29 16:16:57'),
(12, 9, 3, '2020-09-16 13:00:00', '2020-09-29 16:16:57'),
(16, 9, 4, '2020-09-16 17:00:00', '2020-09-29 16:16:57'),
(17, 9, 1, '2021-03-07 09:00:00', '2021-03-07 15:10:07'),
(18, 9, 2, '2021-03-07 11:00:00', '2021-03-07 15:11:06');

-- --------------------------------------------------------

--
-- Table structure for table `deductions`
--

CREATE TABLE `deductions` (
  `id` int(30) NOT NULL,
  `deduction` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deductions`
--

INSERT INTO `deductions` (`id`, `deduction`, `description`) VALUES
(1, 'Cash Advance', 'Cash Advance'),
(3, 'Sample', 'Sample Deduction');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`) VALUES
(1, 'IT Department'),
(2, 'HR Department'),
(3, 'Accounting and Finance Department');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(20) NOT NULL,
  `employee_no` varchar(100) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(20) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `department_id` int(30) NOT NULL,
  `position_id` int(30) NOT NULL,
  `salary` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `employee_no`, `firstname`, `middlename`, `lastname`, `department_id`, `position_id`, `salary`) VALUES
(9, '2020-9838', 'Angel Jude', 'Reyes', 'Suarez', 1, 1, 30000);

-- --------------------------------------------------------

--
-- Table structure for table `employee_allowances`
--

CREATE TABLE `employee_allowances` (
  `id` int(30) NOT NULL,
  `employee_id` int(30) NOT NULL,
  `allowance_id` int(30) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1 = Monthly, 2= Semi-Montly, 3 = once',
  `amount` float NOT NULL,
  `effective_date` date NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_allowances`
--

INSERT INTO `employee_allowances` (`id`, `employee_id`, `allowance_id`, `type`, `amount`, `effective_date`, `date_created`) VALUES
(1, 9, 4, 1, 1000, '0000-00-00', '2020-09-29 11:20:04'),
(3, 9, 3, 2, 300, '0000-00-00', '2020-09-29 11:37:31'),
(5, 9, 1, 3, 1000, '2020-09-16', '2020-09-29 11:38:31');

-- --------------------------------------------------------

--
-- Table structure for table `employee_deductions`
--

CREATE TABLE `employee_deductions` (
  `id` int(30) NOT NULL,
  `employee_id` int(30) NOT NULL,
  `deduction_id` int(30) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1 = Monthly, 2= Semi-Montly, 3 = once',
  `amount` float NOT NULL,
  `effective_date` date NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_deductions`
--

INSERT INTO `employee_deductions` (`id`, `employee_id`, `deduction_id`, `type`, `amount`, `effective_date`, `date_created`) VALUES
(2, 9, 3, 2, 500, '0000-00-00', '2020-09-29 11:52:46'),
(3, 9, 1, 3, 1500, '2020-09-16', '2020-09-29 11:53:27');

-- --------------------------------------------------------

--
-- Table structure for table `payroll`
--

CREATE TABLE `payroll` (
  `id` int(30) NOT NULL,
  `ref_no` text NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1 = monthly ,2 semi-monthly',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 =New,1 = computed',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payroll`
--

INSERT INTO `payroll` (`id`, `ref_no`, `date_from`, `date_to`, `type`, `status`, `date_created`) VALUES
(1, '2020-3543', '2020-09-16', '2020-09-30', 2, 1, '2020-09-29 15:04:13');

-- --------------------------------------------------------

--
-- Table structure for table `payroll_items`
--

CREATE TABLE `payroll_items` (
  `id` int(30) NOT NULL,
  `payroll_id` int(30) NOT NULL,
  `employee_id` int(30) NOT NULL,
  `present` int(30) NOT NULL,
  `absent` int(10) NOT NULL,
  `late` text NOT NULL,
  `salary` double NOT NULL,
  `allowance_amount` double NOT NULL,
  `allowances` text NOT NULL,
  `deduction_amount` double NOT NULL,
  `deductions` text NOT NULL,
  `net` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payroll_items`
--

INSERT INTO `payroll_items` (`id`, `payroll_id`, `employee_id`, `present`, `absent`, `late`, `salary`, `allowance_amount`, `allowances`, `deduction_amount`, `deductions`, `net`, `date_created`) VALUES
(10, 1, 9, 1, 10, '0', 30000, 1300, '[{\"aid\":\"3\",\"amount\":\"300\"},{\"aid\":\"1\",\"amount\":\"1000\"}]', 2000, '[{\"did\":\"3\",\"amount\":\"500\"},{\"did\":\"1\",\"amount\":\"1500\"}]', 664, '2020-09-29 18:46:59');

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `id` int(30) NOT NULL,
  `department_id` int(30) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`id`, `department_id`, `name`) VALUES
(1, 1, 'Programmer'),
(2, 2, 'HR Supervisor'),
(4, 3, 'Accounting Clerk');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `doctor_id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `contact` text NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=admin , 2 = staff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `doctor_id`, `name`, `address`, `contact`, `username`, `password`, `type`) VALUES
(1, 0, 'Administrator', '', '', 'admin', 'admin123', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allowances`
--
ALTER TABLE `allowances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deductions`
--
ALTER TABLE `deductions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_allowances`
--
ALTER TABLE `employee_allowances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_deductions`
--
ALTER TABLE `employee_deductions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll`
--
ALTER TABLE `payroll`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll_items`
--
ALTER TABLE `payroll_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `allowances`
--
ALTER TABLE `allowances`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `deductions`
--
ALTER TABLE `deductions`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `employee_allowances`
--
ALTER TABLE `employee_allowances`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employee_deductions`
--
ALTER TABLE `employee_deductions`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payroll`
--
ALTER TABLE `payroll`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payroll_items`
--
ALTER TABLE `payroll_items`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;



  CREATE TABLE payroll_log (
  id INT AUTO_INCREMENT PRIMARY KEY,
  record_id INT,
  impacted_table VARCHAR(255),
  impacted_column VARCHAR(255),
  old_value VARCHAR(255),
  new_value VARCHAR(255),
  modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
COMMIT;


DELIMITER $$
CREATE TRIGGER `employee_log_trigger` AFTER UPDATE ON `employee`
FOR EACH ROW
BEGIN 
    IF (NEW.firstname != OLD.firstname) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'employee', 'firstname', OLD.firstname, NEW.firstname);
    END IF;
    IF (NEW.middlename != OLD.middlename) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'employee', 'middlename', OLD.middlename, NEW.middlename);
    END IF;
    IF (NEW.lastname != OLD.lastname) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'employee', 'lastname', OLD.lastname, NEW.lastname);
    END IF;
    IF (NEW.department_id != OLD.department_id) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'employee', 'department_id', OLD.department_id, NEW.department_id );
    END IF;
     IF (NEW.position_id != OLD.position_id) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'employee', 'position_id', OLD.position_id, NEW.position_id );
    END IF;
      IF (NEW.salary != OLD.salary) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'employee', 'salary', OLD.salary, NEW.salary );
    END IF;
    
END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER `allowances_log_trigger` AFTER UPDATE ON `allowances`
FOR EACH ROW
BEGIN
    IF (NEW.allowance != OLD.allowance) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'allowances', 'allowance',OLD.allowance, NEW.allowance);
    END IF;
    IF (NEW.description != OLD.description) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'allowances', 'description', OLD.description, NEW.description);
    END IF;       
END$$
DELIMITER ;

DELIMITER $$

CREATE TRIGGER `attendance_log_trigger` AFTER UPDATE ON `attendance`
FOR EACH ROW
BEGIN
    IF (NEW.employee_id != OLD.employee_id) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'attendance', 'employee_id',OLD.employee_id, NEW.employee_id);
    END IF;
    IF (NEW.log_type != OLD.log_type) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'attendance', 'log_type', OLD.log_type, NEW.log_type);
    END IF;  
     IF (NEW.datetime_log != OLD.datetime_log) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'attendance', 'datetime_log', OLD.datetime_log, NEW.datetime_log);
    END IF;    
     IF (NEW.date_updated != OLD.date_updated) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'attendance', 'date_updated', OLD.date_updated, NEW.date_updated);
    END IF;           
END$$
DELIMITER ;

DELIMITER $$

CREATE TRIGGER `deductions_log_trigger` AFTER UPDATE ON `deductions`
FOR EACH ROW
BEGIN
    IF (NEW.deduction != OLD.deduction) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'deductions', 'deduction',OLD.deduction, NEW.deduction);
    END IF;
    IF (NEW.description != OLD.description) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'deductions', 'description', OLD.description, NEW.description);
    END IF;       
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER `department_log_trigger` AFTER UPDATE ON `department`
FOR EACH ROW
BEGIN
    IF (NEW.name != OLD.name) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'department', 'name',OLD.name, NEW.name);
    END IF;         
END$$
DELIMITER ;
DELIMITER $$

CREATE TRIGGER `employee_allowances_log_trigger` AFTER UPDATE ON `employee_allowances`
FOR EACH ROW
BEGIN
    IF (NEW.employee_id != OLD.employee_id) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'employee_allowances', 'employee_id',OLD.employee_id, NEW.employee_id);
    END IF;
    IF (NEW.allowance_id != OLD.allowance_id) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'employee_allowances', 'allowance_id', OLD.allowance_id, NEW.allowance_id);
    END IF;  
     IF (NEW.type != OLD.type) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'employee_allowances', 'type', OLD.type, NEW.type);
    END IF;    
     IF (NEW.amount != OLD.amount) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'employee_allowances', 'amount', OLD.amount, NEW.amount);
    END IF; 
    IF (NEW.effective_date != OLD.effective_date) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'employee_allowances', 'effective_date', OLD.effective_date, NEW.effective_date);
    END IF; 
    IF (NEW.date_created != OLD.date_created) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'employee_allowances', 'date_created', OLD.date_created, NEW.date_created);         
    END IF;           
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER `employee_deductions_log_trigger` AFTER UPDATE ON `employee_deductions`
FOR EACH ROW
BEGIN
    IF (NEW.employee_id != OLD.employee_id) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'employee_deductions', 'employee_id',OLD.employee_id, NEW.employee_id);
    END IF;
    IF (NEW.deduction_id != OLD.deduction_id) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'employee_deductions', 'deduction_id', OLD.deduction_id, NEW.deduction_id);
    END IF;  
     IF (NEW.type != OLD.type) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'employee_deductions', 'type', OLD.type, NEW.type);
    END IF;    
     IF (NEW.amount != OLD.amount) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'employee_deductions', 'amount', OLD.amount, NEW.amount);
    END IF; 
    IF (NEW.effective_date != OLD.effective_date) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'employee_deductions', 'effective_date', OLD.effective_date, NEW.effective_date);
    END IF; 
    IF (NEW.date_created != OLD.date_created) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'employee_deductions', 'date_created', OLD.date_created, NEW.date_created);         
    END IF;           
END$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `payroll_log_trigger` AFTER UPDATE ON `payroll`
FOR EACH ROW
BEGIN
    IF (NEW.ref_no != OLD.ref_no) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'payroll', 'ref_no',OLD.ref_no,NEW.ref_no);
    END IF;
    IF (NEW.date_from != OLD.date_from) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'payroll', 'date_from', OLD.date_from, NEW.date_from);
    END IF;  
     IF (NEW.date_to != OLD.date_to) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'payroll', 'date_to', OLD.date_to, NEW.date_to);
    END IF;    
     IF (NEW.type != OLD.type) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'payroll', 'type', OLD.type, NEW.type);
    END IF; 
    IF (NEW.status != OLD.status) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'payroll', 'status', OLD.status, NEW.status);
    END IF; 
    IF (NEW.date_created != OLD.date_created) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'payroll', 'date_created', OLD.date_created, NEW.date_created);         
    END IF;           
END$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `payroll_items_log_trigger` AFTER UPDATE ON `payroll_items`
FOR EACH ROW
BEGIN
    IF (NEW.payroll_id != OLD.payroll_id) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'payroll_items', 'payroll_id',OLD.payroll_id,NEW.payroll_id);
    END IF;
    IF (NEW.employee_id != OLD.employee_id) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'payroll_items', 'employee_id', OLD.employee_id, NEW.employee_id);
    END IF;  
     IF (NEW.present != OLD.present) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'payroll_items', 'present', OLD.present, NEW.present);
    END IF;    
     IF (NEW.absent != OLD.absent) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'payroll_items', 'absent', OLD.absent, NEW.absent);
    END IF; 
    IF (NEW.late != OLD.late) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'payroll_items', 'late', OLD.late, NEW.late);
    END IF; 
    IF (NEW.salary != OLD.salary) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'payroll_items', 'salary', OLD.salary, NEW.salary);         
    END IF;  
     IF (NEW.allowance_amount != OLD.allowance_amount) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'payroll_items', 'allowance_amount', OLD.allowance_amount, NEW.allowance_amount);         
    END IF; 
    IF (NEW.allowances != OLD.allowances) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'payroll_items', 'allowances', OLD.allowances, NEW.allowances);         
    END IF; 
     IF (NEW.deduction_amount != OLD.deduction_amount) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'payroll_items', 'deduction_amount', OLD.deduction_amount, NEW.deduction_amount);         
    END IF; 
     IF (NEW.deductions != OLD.deductions) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'payroll_items', 'deductions', OLD.deductions, NEW.deductions);         
    END IF; 
     IF (NEW.net != OLD.net) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'payroll_items', 'net', OLD.net, NEW.net);         
    END IF; 
     IF (NEW.date_created != OLD.date_created) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'payroll_items', 'date_created', OLD.date_created, NEW.date_created);         
    END IF;           
END$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `position_log_trigger` AFTER UPDATE ON `position`
FOR EACH ROW
BEGIN
    IF (NEW.department_id != OLD.department_id) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'position', 'department_id',OLD.department_id, NEW.department_id);
    END IF;  
    IF (NEW.name != OLD.name) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'position', 'name',OLD.name, NEW.name);
    END IF;       
END$$
DELIMITER ;

DELIMITER $$

CREATE TRIGGER `users_log_trigger` AFTER UPDATE ON `users`
FOR EACH ROW
BEGIN
    IF (NEW.name != OLD.name) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'users', 'name',OLD.name, NEW.name);
    END IF;
    IF (NEW.address != OLD.address) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'users', 'address', OLD.address, NEW.address);
    END IF;  
     IF (NEW.contact != OLD.contact) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'users', 'contact', OLD.contact, NEW.contact);
    END IF;    
     IF (NEW.username != OLD.username) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'users', 'username', OLD.username, NEW.username);
    END IF; 
    IF (NEW.password != OLD.password) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'users', 'password', OLD.password, NEW.password);
    END IF; 
    IF (NEW.type != OLD.type) THEN
        INSERT INTO payroll_log (`record_id`, `impacted_table`, `impacted_column`, `old_value`, `new_value`)
        VALUES (OLD.id, 'users', 'type', OLD.type, NEW.type);         
    END IF;           
END$$
DELIMITER ;












/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
