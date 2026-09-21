import '../models/module.dart';
import '../models/question.dart';

class TechnicalModules {
  static const List<PlacementModule> modules = [
    PlacementModule(
      id: 31,
      day: 31,
      title: 'C Programming',
      category: 'Technical Skills',
      icon: '🇨',
      definition:
          'C is a procedural programming language used to build efficient and structured programs.',
      formula:
          'Basic structure: input → processing → output. Important concepts include variables, data types, operators, conditions and loops.',
      example:
          'To add two numbers, store them in variables, use the + operator, and display the result.',
      explanation:
          'C fundamentals are important for understanding programming logic, memory and low-level concepts.',
      questions: [
        Question(
          question: 'Which symbol is commonly used to end a C statement?',
          options: ['.', ';', ':', ','],
          answerIndex: 1,
          explanation: 'C statements commonly end with a semicolon.',
        ),
        Question(
          question: 'Which data type is commonly used for whole numbers?',
          options: ['int', 'float', 'char', 'double'],
          answerIndex: 0,
          explanation: 'The int data type stores integer values.',
        ),
        Question(
          question: 'Which function is the usual entry point of a C program?',
          options: ['start()', 'main()', 'run()', 'begin()'],
          answerIndex: 1,
          explanation: 'Execution of a standard C program begins from main().',
        ),
        Question(
          question: 'Which operator is used for addition?',
          options: ['-', '*', '+', '/'],
          answerIndex: 2,
          explanation: 'The + operator performs addition.',
        ),
        Question(
          question: 'Which statement is used for decision making?',
          options: ['if', 'print', 'scan', 'include'],
          answerIndex: 0,
          explanation: 'The if statement allows conditional execution.',
        ),
      ],
    ),

    PlacementModule(
      id: 32,
      day: 32,
      title: 'C++',
      category: 'Technical Skills',
      icon: '⚙️',
      definition:
          'C++ is a general-purpose programming language that supports procedural and object-oriented programming.',
      formula:
          'Important concepts: classes, objects, inheritance, polymorphism, encapsulation and abstraction.',
      example:
          'A class Student can contain properties such as name and age and methods such as display().',
      explanation:
          'C++ extends C with powerful object-oriented and generic programming features.',
      questions: [
        Question(
          question: 'C++ is mainly an extension of which language?',
          options: ['Java', 'Python', 'C', 'SQL'],
          answerIndex: 2,
          explanation: 'C++ evolved from the C programming language.',
        ),
        Question(
          question: 'Which concept combines data and methods inside a class?',
          options: ['Encapsulation', 'Compilation', 'Iteration', 'Recursion'],
          answerIndex: 0,
          explanation: 'Encapsulation bundles data and related methods together.',
        ),
        Question(
          question: 'An object is an instance of a:',
          options: ['Loop', 'Class', 'Variable', 'Function'],
          answerIndex: 1,
          explanation: 'An object is an instance of a class.',
        ),
        Question(
          question: 'Which symbol is used to access a member through an object?',
          options: ['.', '#', '@', '&'],
          answerIndex: 0,
          explanation: 'The dot operator accesses members of an object.',
        ),
        Question(
          question: 'Which feature allows one class to acquire properties of another?',
          options: ['Inheritance', 'Compilation', 'Iteration', 'Parsing'],
          answerIndex: 0,
          explanation: 'Inheritance allows a derived class to acquire features of a base class.',
        ),
      ],
    ),

    PlacementModule(
      id: 33,
      day: 33,
      title: 'Java',
      category: 'Technical Skills',
      icon: '☕',
      definition:
          'Java is a high-level, object-oriented programming language designed to be portable across platforms.',
      formula:
          'Java source code → bytecode → JVM execution.',
      example:
          'A Java class can contain variables and methods, and an object can be created using the new keyword.',
      explanation:
          'Java uses the Java Virtual Machine to execute bytecode on different platforms.',
      questions: [
        Question(
          question: 'Java is primarily a:',
          options: [
            'Object-oriented language',
            'Database',
            'Operating system',
            'Web browser'
          ],
          answerIndex: 0,
          explanation: 'Java is an object-oriented programming language.',
        ),
        Question(
          question: 'What executes Java bytecode?',
          options: ['JVM', 'CPU only', 'HTML', 'SQL'],
          answerIndex: 0,
          explanation: 'The Java Virtual Machine executes Java bytecode.',
        ),
        Question(
          question: 'Which keyword creates an object in Java?',
          options: ['make', 'create', 'new', 'object'],
          answerIndex: 2,
          explanation: 'The new keyword is used to create objects.',
        ),
        Question(
          question: 'Which method is commonly the entry point of a Java application?',
          options: ['start()', 'main()', 'run()', 'execute()'],
          answerIndex: 1,
          explanation: 'The main() method is the standard application entry point.',
        ),
        Question(
          question: 'Which keyword is used to inherit a class?',
          options: ['extends', 'inherits', 'using', 'parent'],
          answerIndex: 0,
          explanation: 'The extends keyword is used for class inheritance.',
        ),
      ],
    ),

    PlacementModule(
      id: 34,
      day: 34,
      title: 'Python',
      category: 'Technical Skills',
      icon: '🐍',
      definition:
          'Python is a high-level programming language known for readable syntax and a large standard library.',
      formula:
          'Python programs use indentation to define blocks of code.',
      example:
          'A simple Python program can store a value in a variable and print it using print().',
      explanation:
          'Python is widely used in software development, automation, data science and artificial intelligence.',
      questions: [
        Question(
          question: 'Which function is used to display output in Python?',
          options: ['display()', 'print()', 'show()', 'output()'],
          answerIndex: 1,
          explanation: 'print() displays output in Python.',
        ),
        Question(
          question: 'Which symbol starts a comment in Python?',
          options: ['//', '#', '/*', '--'],
          answerIndex: 1,
          explanation: 'A single-line Python comment starts with #.',
        ),
        Question(
          question: 'Which data structure stores key-value pairs?',
          options: ['List', 'Tuple', 'Dictionary', 'Set'],
          answerIndex: 2,
          explanation: 'A dictionary stores data as key-value pairs.',
        ),
        Question(
          question: 'Which keyword defines a function in Python?',
          options: ['function', 'def', 'fun', 'define'],
          answerIndex: 1,
          explanation: 'The def keyword defines a function.',
        ),
        Question(
          question: 'Python uses what to define code blocks?',
          options: ['Brackets only', 'Indentation', 'Semicolons only', 'Commas'],
          answerIndex: 1,
          explanation: 'Python uses indentation to define code blocks.',
        ),
      ],
    ),

    PlacementModule(
      id: 35,
      day: 35,
      title: 'Object-Oriented Programming',
      category: 'Technical Skills',
      icon: '🧱',
      definition:
          'Object-Oriented Programming organizes software around objects containing data and behavior.',
      formula:
          'Four major OOP concepts: Encapsulation, Abstraction, Inheritance and Polymorphism.',
      example:
          'A Car class can contain properties such as color and methods such as start().',
      explanation:
          'OOP helps structure large programs using reusable and organized components.',
      questions: [
        Question(
          question: 'Which OOP concept hides internal implementation details?',
          options: ['Abstraction', 'Inheritance', 'Compilation', 'Iteration'],
          answerIndex: 0,
          explanation: 'Abstraction hides unnecessary implementation details.',
        ),
        Question(
          question: 'Which OOP concept allows one class to derive from another?',
          options: ['Inheritance', 'Encapsulation', 'Abstraction', 'Overloading'],
          answerIndex: 0,
          explanation: 'Inheritance allows a class to derive features from another class.',
        ),
        Question(
          question: 'Which concept means one interface can have multiple implementations?',
          options: ['Polymorphism', 'Compilation', 'Iteration', 'Parsing'],
          answerIndex: 0,
          explanation: 'Polymorphism allows the same interface to represent different implementations.',
        ),
        Question(
          question: 'Bundling data and methods together is called:',
          options: ['Encapsulation', 'Inheritance', 'Recursion', 'Compilation'],
          answerIndex: 0,
          explanation: 'Encapsulation combines data and related behavior.',
        ),
        Question(
          question: 'A blueprint for creating objects is called a:',
          options: ['Class', 'Loop', 'Variable', 'Operator'],
          answerIndex: 0,
          explanation: 'A class acts as a blueprint for objects.',
        ),
      ],
    ),

    PlacementModule(
      id: 36,
      day: 36,
      title: 'Data Structures',
      category: 'Technical Skills',
      icon: '🌳',
      definition:
          'Data structures organize and store data so that it can be accessed and modified efficiently.',
      formula:
          'Common structures include arrays, linked lists, stacks, queues, trees and graphs.',
      example:
          'A stack follows LIFO: the last element inserted is the first element removed.',
      explanation:
          'Choosing the appropriate data structure can improve program performance and organization.',
      questions: [
        Question(
          question: 'Which data structure follows LIFO?',
          options: ['Queue', 'Stack', 'Graph', 'Tree'],
          answerIndex: 1,
          explanation: 'A stack follows Last In, First Out.',
        ),
        Question(
          question: 'Which data structure follows FIFO?',
          options: ['Stack', 'Queue', 'Tree', 'Graph'],
          answerIndex: 1,
          explanation: 'A queue follows First In, First Out.',
        ),
        Question(
          question: 'Which structure stores elements in indexed positions?',
          options: ['Array', 'Graph', 'Tree', 'Stack only'],
          answerIndex: 0,
          explanation: 'Arrays store elements in indexed positions.',
        ),
        Question(
          question: 'A linked list consists of connected:',
          options: ['Nodes', 'Tables', 'Files', 'Databases'],
          answerIndex: 0,
          explanation: 'Linked lists are made up of nodes connected through links.',
        ),
        Question(
          question: 'A tree structure generally has a starting node called:',
          options: ['Root', 'Leaf', 'Edge', 'Queue'],
          answerIndex: 0,
          explanation: 'The topmost node of a tree is called the root.',
        ),
      ],
    ),

    PlacementModule(
      id: 37,
      day: 37,
      title: 'Algorithms',
      category: 'Technical Skills',
      icon: '⚡',
      definition:
          'An algorithm is a finite sequence of well-defined steps used to solve a problem.',
      formula:
          'Algorithm efficiency is commonly analyzed using time and space complexity.',
      example:
          'Linear search checks elements one by one until the target is found or the list ends.',
      explanation:
          'Good algorithms solve problems correctly while using reasonable time and memory.',
      questions: [
        Question(
          question: 'An algorithm is a:',
          options: [
            'Programming language',
            'Step-by-step solution',
            'Database',
            'Computer'
          ],
          answerIndex: 1,
          explanation: 'An algorithm is a step-by-step procedure for solving a problem.',
        ),
        Question(
          question: 'Which search checks elements one by one?',
          options: ['Binary search', 'Linear search', 'Hash search', 'Tree search'],
          answerIndex: 1,
          explanation: 'Linear search checks elements sequentially.',
        ),
        Question(
          question: 'Binary search requires data to be generally:',
          options: ['Sorted', 'Deleted', 'Encrypted', 'Randomly arranged'],
          answerIndex: 0,
          explanation: 'Binary search works efficiently on sorted data.',
        ),
        Question(
          question: 'Which notation describes algorithm growth rate?',
          options: ['Big O', 'HTML', 'SQL', 'JSON'],
          answerIndex: 0,
          explanation: 'Big O notation describes asymptotic growth of complexity.',
        ),
        Question(
          question: 'An algorithm should eventually:',
          options: [
            'Never stop',
            'Produce a result',
            'Delete all data',
            'Crash'
          ],
          answerIndex: 1,
          explanation: 'A valid algorithm should terminate and produce a result.',
        ),
      ],
    ),

    PlacementModule(
      id: 38,
      day: 38,
      title: 'DBMS',
      category: 'Technical Skills',
      icon: '🗄️',
      definition:
          'A Database Management System is software used to create, store, organize and retrieve structured data.',
      formula:
          'Common DBMS concepts: tables, rows, columns, primary keys, foreign keys and SQL.',
      example:
          'A Student table may contain StudentID, Name and Course columns.',
      explanation:
          'DBMS provides structured storage and controlled access to data.',
      questions: [
        Question(
          question: 'DBMS stands for:',
          options: [
            'Database Management System',
            'Data Backup Management Software',
            'Digital Base Management System',
            'Database Machine System'
          ],
          answerIndex: 0,
          explanation: 'DBMS means Database Management System.',
        ),
        Question(
          question: 'A table row is also called a:',
          options: ['Record', 'Field', 'Column', 'Database'],
          answerIndex: 0,
          explanation: 'A row represents a record.',
        ),
        Question(
          question: 'A table column is also called a:',
          options: ['Record', 'Field', 'Row', 'Database'],
          answerIndex: 1,
          explanation: 'A column represents a field or attribute.',
        ),
        Question(
          question: 'Which key uniquely identifies a record?',
          options: ['Foreign key', 'Primary key', 'Duplicate key', 'Temporary key'],
          answerIndex: 1,
          explanation: 'A primary key uniquely identifies records in a table.',
        ),
        Question(
          question: 'Which language is commonly used to query relational databases?',
          options: ['HTML', 'SQL', 'CSS', 'XML'],
          answerIndex: 1,
          explanation: 'SQL is commonly used to interact with relational databases.',
        ),
      ],
    ),

    PlacementModule(
      id: 39,
      day: 39,
      title: 'Operating Systems',
      category: 'Technical Skills',
      icon: '🖥️',
      definition:
          'An operating system manages computer hardware, software resources and provides services to applications.',
      formula:
          'Major OS responsibilities include process management, memory management, file management and device management.',
      example:
          'When several applications run at once, the operating system manages CPU time between processes.',
      explanation:
          'The OS acts as an interface between users, applications and computer hardware.',
      questions: [
        Question(
          question: 'Which is an operating system?',
          options: ['Linux', 'MySQL', 'HTML', 'Python'],
          answerIndex: 0,
          explanation: 'Linux is an operating system.',
        ),
        Question(
          question: 'Which resource does an OS manage?',
          options: ['CPU', 'Memory', 'Files', 'All of these'],
          answerIndex: 3,
          explanation: 'An OS manages CPU, memory, files and other resources.',
        ),
        Question(
          question: 'A running program is called a:',
          options: ['Process', 'Folder', 'Database', 'Compiler'],
          answerIndex: 0,
          explanation: 'A program in execution is called a process.',
        ),
        Question(
          question: 'Which OS component manages hardware resources?',
          options: ['Kernel', 'Browser', 'Editor', 'Database'],
          answerIndex: 0,
          explanation: 'The kernel is the core component responsible for resource management.',
        ),
        Question(
          question: 'Which is used for managing files?',
          options: ['File system', 'Compiler', 'Router', 'Keyboard'],
          answerIndex: 0,
          explanation: 'A file system organizes and manages stored files.',
        ),
      ],
    ),

    PlacementModule(
      id: 40,
      day: 40,
      title: 'Computer Networks',
      category: 'Technical Skills',
      icon: '🌐',
      definition:
          'Computer networking connects devices so they can communicate and share data and resources.',
      formula:
          'Important concepts include IP addresses, protocols, routers, switches, LAN, WAN and the Internet.',
      example:
          'A router forwards network packets between different networks.',
      explanation:
          'Networking knowledge helps understand how computers and services communicate.',
      questions: [
        Question(
          question: 'What does LAN stand for?',
          options: [
            'Local Area Network',
            'Large Access Network',
            'Linked Area Node',
            'Local Application Network'
          ],
          answerIndex: 0,
          explanation: 'LAN stands for Local Area Network.',
        ),
        Question(
          question: 'Which device commonly forwards packets between networks?',
          options: ['Router', 'Keyboard', 'Monitor', 'Printer'],
          answerIndex: 0,
          explanation: 'A router forwards packets between networks.',
        ),
        Question(
          question: 'What does IP stand for in IP address?',
          options: [
            'Internet Protocol',
            'Internal Program',
            'Internet Process',
            'Input Protocol'
          ],
          answerIndex: 0,
          explanation: 'IP stands for Internet Protocol.',
        ),
        Question(
          question: 'Which protocol is commonly used to load web pages securely?',
          options: ['HTTPS', 'FTP', 'SMTP', 'POP3'],
          answerIndex: 0,
          explanation: 'HTTPS is used for secure web communication.',
        ),
        Question(
          question: 'Which device connects multiple devices within a local network?',
          options: ['Switch', 'Scanner', 'Speaker', 'Keyboard'],
          answerIndex: 0,
          explanation: 'A network switch connects devices within a local network.',
        ),
      ],
    ),
  ];
}