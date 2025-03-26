import 'package:new_portfolio/data/models/company_model.dart';
import 'package:new_portfolio/data/models/education_model.dart';
import 'package:new_portfolio/data/models/project_model.dart';
import 'package:new_portfolio/data/models/skill_model.dart';
import 'package:new_portfolio/data/models/my_info_model.dart';

// Thông tin cá nhân cơ bản
final basicInfo = MyInfoModel(
  name: "Nguyễn Thanh Minh",
  phone: "0798334803",
  email: "ntminh16201@gmail.com",
  github: "https://github.com/ThanhMinh1602",
  location: "k583/15 Tôn Đức Thắng, Hòa Khánh Nam, Liên Chiểu, TP Đà Nẵng",
  role: "Mobile Developer",
  shortTermGoal:
      "Become a professional Flutter developer with strong expertise in building cross-platform applications.",
  longTermGoal:
      "Gain comprehensive knowledge of mobile app development, including Native and cross-platform technologies, and contribute to the developer community.",
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
        "Developed a mobile app for a client using Flutter and Firebase, with features such as authentication, CRUD operations, and CI/CD integration.",
    projects: [
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
      ),
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
      ),
      ProjectModel(
        title: "Global Camera",
        description:
            "Streaming video from cameras to AWS, with viewing, trimming, and downloading functionalities.",
        technologies: ["Flutter", "PHP Laravel", "AWS"],
        features: ["Live streaming", "Video trimming", "AWS integration"],
        timeline: "Nov 2023 - Oct 2024",
      ),
    ],
  ),
];

// Dự án cá nhân
final personalProjectsData = [
  ProjectModel(
    title: "To Do",
    description:
        "A task management app with authentication, CRUD operations, and CI/CD integration.",
    technologies: [
      "Flutter",
      "Firebase",
      "BLoC",
      "GitHub Actions",
      "Unit Test",
      "Integration Test",
    ],
    features: [
      "Authentication",
      "Task CRUD",
      "Unit & Integration Tests",
      "CI/CD",
    ],
    fontendLink: "https://github.com/ThanhMinhProjects/todo_bloc.git",
    timeline: "Dec 2024 - Present",
    videoUrl: "https://www.youtube.com/watch?v=XVXzLh2SY58",
  ),
  ProjectModel(
    title: "Momentsy",
    description:
        "A social media app for capturing and sharing moments, with real-time chat and QR code connections.",
    technologies: [
      "Flutter",
      "GetX",
      "MVVM",
      "Node.js",
      "Express.js",
      "WebSocket",
      "Google Cloud",
    ],
    features: [
      "Real-time chat",
      "QR code friend-adding",
      "Push notifications",
      "Google Drive integration",
    ],
    fontendLink: "https://github.com/ThanhMinh1602/momentsy",
    backendLink: "https://github.com/ThanhMinh1602/doodle_mood_server",
    timeline: "Early March 2025 - Present",
    videoUrl: "https://www.youtube.com/watch?v=FQ_6yX54j1A",
  ),
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
  ProjectModel(
    title: "Capybara Game",
    description:
        "Memory Capybara is a fun memory game where you flip cards to find matching pairs. With adorable Capybara images and increasing difficulty levels, it’s a great way to train your memory while having fun! 🚀🐾",
    technologies: ["Flutter", "Bloc", "Shared Preferences"],
    features: ["Memory game", "Score tracking", "Difficulty levels"],
    fontendLink: "https://github.com/ThanhMinh1602/capybara_game",
    timeline: "Jul 2024 - Aug 2024",
    videoUrl: "https://www.youtube.com/watch?v=FQ_6yX54j1A",
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
