import 'package:new_portfolio/data/models/company_model.dart';
import 'package:new_portfolio/data/models/education_model.dart';
import 'package:new_portfolio/data/models/project_model.dart';
import 'package:new_portfolio/data/models/skill_model.dart';
import 'package:new_portfolio/data/models/my_info_model.dart';

// Thông tin cá nhân cơ bản
final basicInfo = MyInfoModel(
  name: "Nguyen Thanh Minh",
  phone: "0798334803",
  email: "ntminh16201@gmail.com",
  github: "https://github.com/ThanhMinh1602",
  location:
      "K583/15 Ton Duc Thang Street, Hoa Khanh Nam Ward, Lien Chieu District, Da Nang City",
  role: "Mobile Developer",
  shortTermGoal:
      "Aspire to become a highly skilled and professional Flutter developer, mastering the art of creating efficient, scalable, and visually appealing cross-platform applications that deliver exceptional user experiences across both iOS and Android platforms.",

  longTermGoal:
      "Aim to acquire in-depth and comprehensive knowledge of mobile app development, encompassing both Native technologies (such as Swift for iOS and Kotlin for Android) and cross-platform frameworks like Flutter and React Native, while actively contributing to the developer community through sharing expertise, building innovative tools, and mentoring aspiring developers.",
  education: educationData,
  skills: skillsData,
  workExperience: workExperienceData,
  personalProjects: personalProjectsData,
  interests: interestsData,
);

// Thông tin giáo dục
final educationData = EducationModel(
  school: "University of Science and Education - The University of Da Nang",
  major: "Information Technology",
  duration: "June 2020 - November 2024",
);

// Danh sách kỹ năng
final skillsData = [
  SkillModel(title: "Programming Languages", skills: ["Dart", "JavaScript"]),
  SkillModel(title: "Frameworks", skills: ["Flutter", "Node.js"]),
  SkillModel(title: "State Management", skills: ["BLoC", "Provider", "GetX"]),
  SkillModel(
    title: "Architectural Patterns",
    skills: ["OOP", "Clean Architecture", "MVC", "MVVM", "Dartz"],
  ),
  SkillModel(
    title: "Databases",
    skills: ["SQLite", "Shared Preferences", "Firebase", "MongoDB"],
  ),
  SkillModel(
    title: "Networking",
    skills: ["REST API", "Swagger UI", "WebSocket"],
  ),
  SkillModel(title: "Testing", skills: ["Unit Test", "Integration Test"]),
  SkillModel(title: "CI/CD", skills: ["GitHub Actions"]),
  SkillModel(title: "Tools", skills: ["Git", "Backlog", "Postman"]),
  SkillModel(
    title: "Soft Skills",
    skills: ["Team collaboration", "English technical reading comprehension"],
  ),
];

// Kinh nghiệm làm việc
final workExperienceData = [
  CompanyModel(
    name: "Rikai Technology",
    position: "Mobile Developer",
    duration: "Nov 2023 - Oct 2024",
    location: "Vietnam",
    description:
        "Learned Bloc State Management, Flutter Clean Architecture, and Postman. Practiced teamwork skills and deepened knowledge of Git (GitLab). Explored and utilized Backlog as a project management tool. Participated in real company projects, gained insights into React Native, and contributed to writing a chat bot using Express.js for internal project management.",
    projects: [
      // Aloo
      ProjectModel(
        title: "Aloo",
        description:
            "A sim card selling application for Vietnamese people in Japan.",
        technologies: ["Flutter", "Firebase", "Python"],
        features: [
          "UI improvements",
          "Language change functionality",
          "Ongoing app enhancements",
        ],
        fontendLink: "https://play.google.com/store/apps/details?id=jp.aloo",
        timeline: "Nov 2023 - Oct 2024",
        videoUrl: "https://www.youtube.com/watch?v=XVXzLh2SY58",
        role: "Multi-language, bug fixing,...",
      ),
      // Rikai Assistant
      ProjectModel(
        title: "Rikai Assistant",
        description:
            "A chatbot that reports task progress and notifies team members of their tasks.",
        technologies: [
          "Express.js",
          "MySQL",
          "Docker",
          "DBeaver",
          "Google Cloud",
          "Sequelize",
          "Ngrok",
        ],
        features: [
          "Task progress reporting",
          "Member notifications",
          "Overdue task alerts",
        ],
        timeline: "Nov 2023 - Oct 2024",
        videoUrl: "https://www.youtube.com/watch?v=XVXzLh2SY58",
        role:
            "Mainly responsible for implementing the described functionalities.",
      ),
      // Global Camera
      ProjectModel(
        title: "Global Camera",
        description:
            "Streaming video from cameras to AWS, with viewing, trimming, and downloading functionalities.",
        technologies: ["Flutter", "PHP Laravel", "AWS"],
        features: ["Live streaming", "Video trimming", "AWS integration"],
        timeline: "Nov 2023 - Oct 2024",
        role: "UI design, API interaction, bug fixing,...",
      ),
    ],
  ),
];

// Dự án cá nhân
final personalProjectsData = [
  // To Do
  ProjectModel(
    title: "To Do",
    description:
        "A task management app with authentication, CRUD operations, and CI/CD integration.",
    technologies: [
      "Flutter",
      "Firebase",
      "BLoC",
      "GitHub Actions(CI/CD)",
      "Unit Test",
      "Integration Test",
      "Clean Architecture",
    ],
    features: [
      "Authentication",
      "Task CRUD",
      "Unit & Integration Tests",
      "CI/CD",
    ],
    fontendLink: "https://github.com/ThanhMinhProjects/todo_bloc.git",
    timeline: "Dec 2024 - Present",
    // videoUrl: "https://www.youtube.com/watch?v=XVXzLh2SY58",
  ),
  // Momentsy
  ProjectModel(
    title: "Momentsy",
    description:
        "Momentsy is a mobile application that enables users to capture photos, share moments, chat, and connect with friends via QR codes. The app features real-time messaging through WebSocket, image storage on Google Drive API, and a secure authentication system.",
    technologies: [
      "Flutter",
      "GetX",
      "MVVM",
      "Node.js",
      "Express.js",
      "WebSocket",
      "Google Cloud",
      "Firebase(push notification)",
    ],
    features: [
      "Authentication (Login, Logout, Registration, Forgot Password, Change Password, OTP)",
      "Camera Integration",
      "File Uploads to Google Drive",
      "Real-time Chat with WebSocket",
      "QR Code Friend-Adding",
      "Push Notifications",
      "User Profile Updates",
    ],
    fontendLink: "https://github.com/ThanhMinh1602/momentsy",
    backendLink: "https://github.com/ThanhMinh1602/doodle_mood_server",
    timeline: "Early March 2025 - Present",
    // videoUrl: "https://www.youtube.com/watch?v=FQ_6yX54j1A",
  ),
  // Task management integrated with Gemini
  ProjectModel(
    title: "Task management integrated with Gemini",
    description:
        "A task management app with authentication, CRUD operations, and Gemini API integration.",
    technologies: [
      "Flutter",
      "Firebase",
      "GetX",
      "Gemini API",
      "Unit Test",
      "Integration Test",
    ],
    features: [
      "Authentication",
      "Task CRUD",
      "Unit & Integration Tests",
      "User manager",
    ],
    fontendLink: "https://github.com/ThanhMinh1602/task_AI_getx",
    timeline: "Dec 12, 2024 - End of Dec, 2024",
    videoUrl: "https://www.youtube.com/watch?v=XVXzLh2SY58",
  ),
  // Capybara Game
  ProjectModel(
    title: "Capybara Game",
    description:
        "Memory Capybara is a fun memory game where you flip cards to find matching pairs. With adorable Capybara images and increasing difficulty levels, it’s a great way to train your memory while having fun! 🚀🐾",
    technologies: ["Flutter", "Bloc", "Shared Preferences"],
    features: ["Memory game", "Score tracking", "Difficulty levels"],
    fontendLink: "https://github.com/ThanhMinh1602/capybara_game",
    branch: "develop",
    timeline: "Jul 2024 - Aug 2024",
    videoUrl: "https://www.youtube.com/watch?v=qcPKol5c_7U",
  ),
  //Nike shoes Shop
  ProjectModel(
    title: "Nike Shoe Shop",
    description:
        "A mobile app and web admin system for a Nike shoe shop, featuring authentication, product management, and payment integration.",
    technologies: [
      "Flutter",
      "Firebase",
      "Bloc State Management",
      "Clean Architecture",
      "Paypal Api",
    ],
    features: [
      "Authentication",
      "Paypal Payment",
      "Search Product",
      "Cart Management",
      "Product Management (Web Admin)",
      "Category Management (Web Admin)",
      "Order Management (Web Admin)",
      "Employee Management (Web Admin)",
    ],
    fontendLink:
        "https://github.com/ThanhMinh1602/nike_shoe_shop.git", // Mobile source code
    backendLink:
        "https://github.com/ThanhMinh1602/web_admin.git", // Web admin source code
    timeline: "Mar 10 - Apr 13, 2024",
    // videoUrl: "https://www.youtube.com/watch?v=XVXzLh2SY58",
  ),
];

// Sở thích cá nhân
final interestsData = [
  "Listening to music",
  "Playing games",
  "Backpacking",
  "Watching movies",
  "Playing badminton",
  "Playing the flute",
];

// Gộp lại
final mockMyInfo = basicInfo;
