# Software Requirements Specification (SRS)
## Student Attendance Management System

### 1. Introduction

#### 1.1 Purpose
This document specifies the functional and non-functional requirements for the Student Attendance Management System (SAMS). The system is designed to manage attendance tracking for students, faculty, and administrators in an educational institution.

#### 1.2 Scope
The system covers three user roles:
- **Administrator**: Full system management including regulation, course, department, and faculty management
- **Faculty**: Subject assignment, attendance marking, and view assigned subjects/semesters
- **Student**: View attendance, profile details, and change password

#### 1.3 Definitions and Acronyms
- **SAMS**: Student Attendance Management System
- **JSP**: JavaServer Pages
- **SQL**: Structured Query Language

#### 1.4 References
- Java EE Specification
- MySQL Database Documentation
- Bootstrap CSS Framework

---

### 2. Overall Description

#### 2.1 Product Perspective
The system is a web-based application built using JSP technology with MySQL database backend. It follows a three-tier architecture (presentation, business logic, data access).

#### 2.2 Product Functions
Core functions include:
- User authentication and authorization
- Student registration and profile management
- Course and regulation management
- Attendance marking and viewing
- Faculty assignment and management

#### 2.3 User Characteristics
- **Administrators**: Institutional staff with full system access
- **Faculty**: Teaching staff with subject-specific access
- **Students**: Enrolled students with self-service access

#### 2.4 Operating Environment
- Web browser (Chrome, Firefox, Edge, Safari)
- Apache Tomcat 10.1.56 server
- MySQL 8.0+ database
- Internet connectivity for initial setup

#### 2.5 Constraints
- Must use MySQL database
- JSP-based web application
- Windows/Linux server environment
- UTF-8 character encoding

#### 2.6 Assumptions and Dependencies
- MySQL server is installed and configured
- Tomcat server is operational
- Valid database credentials are available
- Network connectivity for database access

---

### 3. System Requirements

#### 3.1 Functional Requirements

##### 3.1.1 Authentication Module
| Requirement ID | Description |
|----------------|-------------|
| FR-001 | System shall authenticate administrator credentials against database |
| FR-002 | System shall authenticate faculty credentials against database |
| FR-003 | System shall authenticate student credentials against database |
| FR-004 | Invalid login attempts shall display error message |
| FR-005 | Successful login shall redirect to respective dashboard |

##### 3.1.2 Administrator Functions
| Requirement ID | Description |
|----------------|-------------|
| FR-010 | System shall allow administrator to add, edit, and delete regulations |
| FR-011 | System shall allow administrator to add, edit, and delete courses |
| FR-012 | System shall allow administrator to add, edit, and delete departments |
| FR-013 | System shall allow administrator to add, edit, and delete faculty members |
| FR-014 | System shall allow administrator to view all system users |

##### 3.1.3 Faculty Functions
| Requirement ID | Description |
|----------------|-------------|
| FR-020 | System shall allow faculty to login to faculty dashboard |
| FR-021 | System shall display faculty's assigned subjects/semesters |
| FR-022 | System shall allow faculty to mark attendance for their subjects |
| FR-023 | System shall allow faculty to view attendance reports |
| FR-024 | System shall allow faculty to change their password |

##### 3.1.4 Student Functions
| Requirement ID | Description |
|----------------|-------------|
| FR-030 | System shall allow student to login to student portal |
| FR-031 | System shall display student profile information |
| FR-032 | System shall allow student to view their attendance records |
| FR-033 | System shall allow student to change their password |
| FR-034 | System shall allow student to view course and section details |

##### 3.1.5 Attendance Management
| Requirement ID | Description |
|----------------|-------------|
| FR-040 | System shall allow marking attendance for a student |
| FR-041 | System shall record attendance date, student ID, and status (Present/Absent) |
| FR-042 | System shall prevent duplicate attendance entries for same student/date |
| FR-043 | System shall store attendance in database with timestamp |
| FR-044 | System shall provide search functionality for student attendance |

#### 3.2 Non-Functional Requirements

##### 3.2.1 Performance Requirements
- Page load time: < 3 seconds for standard pages
- Attendance marking: < 2 seconds
- Search operations: < 1 second

##### 3.2.2 Security Requirements
- Passwords must be hashed (currently stored as plain text - noted for improvement)
- Session timeout after 30 minutes of inactivity
- Role-based access control
- Input validation to prevent SQL injection

##### 3.2.3 Reliability Requirements
- System uptime: 99.5% during operating hours
- Database backup required daily
- Error handling for database connection failures

##### 3.2.4 Maintainability Requirements
- Code structured in separate JSP files by functionality
- Database queries separated from presentation logic
- Comments added to all JSP files
- Easy addition of new features through existing patterns

##### 3.2.5 Portability Requirements
- Browser-independent (tested on major browsers)
- Operating system independent (Windows/Linux)
- Database independent (MySQL specific but easily adaptable)

#### 3.3 Data Requirements

##### 3.3.1 Database Schema Overview

**Tables Required:**
1. **administrator** - administrator_id, username, password, administrator_name
2. **faculty** - faculty_id, username, password, faculty_name, department_id
3. **student** - student_id, student_name, gender, dob, mobile, email, address, regulation_id, course_id, department_id, semester, section, password
4. **regulation** - regulation_id, regulation_name
5. **course** - course_id, course_name, duration
6. **department** - department_id, department_name
7. **attendance** - attendance_id, student_id, attendance_date, status (Present/Absent), marked_by

##### 3.3.2 Data Validation Rules
- Student ID: 8-10 alphanumeric characters, required
- Student Name: 2-50 characters, alphabetic, required
- Gender: Male/Female, required
- Date of Birth: Valid date, not future date
- Mobile: 10 digits, numeric only
- Email: Valid email format
- Regulation ID: Must exist in regulation table
- Course ID: Must exist in course table
- Department ID: Must exist in department table
- Semester: 1-1, 1-2, 2-1, 2-2, 3-1, 3-2, 4-1, 4-2
- Section: Alphanumeric, max 10 characters

#### 3.4 Interface Requirements

##### 3.4.1 User Interfaces
- **Index Page**: Main landing page with login options for all user roles
- **Administrator Login**: Credential validation and dashboard access
- **Faculty Login**: Credential validation and dashboard access
- **Student Login**: Credential validation and dashboard access
- **Administrator Dashboard**: Main control panel with quick access to all management functions
- **Faculty Dashboard**: Subject/section overview and attendance tools
- **Student Dashboard**: Personal attendance and profile view
- **Attendance Management**: Mark and view attendance records
- **Student Profile**: Detailed student information display
- **Student Attendance View**: Historical attendance records

##### 3.4.2 Input/Output Interfaces
- **Input**: HTML forms, dropdown selections, text inputs, date pickers
- **Output**: HTML pages, tables, formatted data display, error messages

##### 3.4.3 Communication Interfaces
- HTTP requests between client and server
- JSP to MySQL database communication via JDBC
- Session management via HTTP cookies

#### 3.5 Algorithmic Requirements

##### 3.5.1 Attendance Marking Algorithm
1. Receive student ID, attendance date, and status (Present/Absent)
2. Check if attendance record already exists for student/date combination
3. If not exists, insert new attendance record with timestamp
4. If exists, update existing record or display error
5. Redirect to dashboard with success/error message

##### 3.5.2 Login Validation Algorithm
1. Receive username and password
2. Connect to database
3. Execute SELECT query with parameterized credentials
4. If record found, set session attributes and redirect
5. If not found, display authentication error
6. Close database connections

##### 3.5.3 Student Registration Algorithm
1. Receive all student details through form
2. Validate all input fields
3. Check if student ID already exists
4. If not exists, insert student record into database
5. Generate temporary password or assign default
6. Redirect to student list with success message

---

### 4. External Interface Requirements

#### 4.1 Graphical User Interface
- Consistent color scheme: #003366 (primary), #1e3a8a (secondary), #f4f6f9 (background)
- Font: Arial, sans-serif throughout
- Responsive design for mobile and desktop viewing
- Font Awesome icons for visual elements

#### 4.2 Hardware Requirements
- Server: Minimum 4GB RAM, 2 CPU cores
- Client: Any modern device with web browser
- Network: Ethernet or WiFi internet connectivity

#### 4.3 Software Requirements
- Apache Tomcat 10.1.56 or higher
- MySQL 8.0 or higher
- Java JDK 8 or higher
- Web browser: Chrome/Firefox/Edge/Safari (latest version)
- IDE: Eclipse, NetBeans, or IntelliJ IDEA

---

### 5. Other Non-Functional Requirements

#### 5.1 Scalability
- System supports up to 1000 concurrent users
- Database indexing recommended for large student records
- Connection pooling for database access

#### 5.2 Availability
- System available 24/7 for authorized users
- Maintenance window: Sundays 2:00 AM - 4:00 AM
- Backup requirements: Daily database backup

#### 5.3 Usability
- Intuitive navigation structure
- Clear error messages and feedback
- Consistent layout across all pages
- Accessible color contrast (WCAG AA compliance partial)

#### 5.4 Efficiency
- Optimized SQL queries with WHERE clauses
- Minimal database round trips
- Caching for frequently accessed data (regulations, courses, departments)

#### 5.5 Interoperability
- Compatible with existing institutional systems
- Export capabilities for attendance reports (noted for future enhancement)
- CSV import/export for batch operations (noted for future enhancement)

---

### 6. Revision History

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | 2026-09-27 | Development Team | Initial SRS document creation |

---

### 7. Appendices

#### Appendix A: Database Entity-Relationship Diagram
```
[Administrator] 1--< Faculty
                 |
                 v
[Faculty] 1--< Student
                 |
                 v
[Student] ---- Attendance
                 |
                 v
[Regulation] 1--< Course
                 |
                 v
[Course] 1--< Department
```

#### Appendix B: System Flow Diagrams
- Login flow: User credentials → Validation → Dashboard redirection
- Attendance marking: Student selection → Date/status input → Database insert
- Student registration: Form submission → Validation → Database insert

#### Appendix C: Error Handling Guidelines
- Database connection errors: Display generic error, log detailed error
- Validation errors: Highlight invalid fields, display specific messages
- System errors: Log to file, display "Technical Difficulties" message
- Authentication errors: "Invalid username or password" message

#### Appendix D: Assumptions and Constraints
- MySQL database is properly configured and accessible
- Tomcat server is running on default port 8080
- Network firewall allows outbound connections to database
- User passwords are at least 6 characters long
- Student IDs are unique across the system