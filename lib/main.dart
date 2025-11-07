import 'package:flutter/material.dart';

class MyListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String team;
  final IconData icon;
  final VoidCallback? onTap;

  const MyListItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.team,
    this.icon = Icons.arrow_forward_ios,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          leading: CircleAvatar(
            radius: 26,
            backgroundColor: Colors.blue.shade100,
            child: Icon(Icons.school, color: Colors.blue.shade800, size: 28),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subtitle,
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 4),
              Text(
                "Team: $team",
                style: const TextStyle(
                  fontSize: 13,
                  fontStyle: FontStyle.italic,
                  color: Colors.deepPurple,
                ),
              ),
            ],
          ),
          trailing: Icon(icon, color: Colors.blueGrey),
        ),
      ),
    );
  }
}


void main() {
  runApp(const ProjectExhibitionApp());
}

class ProjectExhibitionApp extends StatelessWidget {
  const ProjectExhibitionApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Exhibition',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey.shade100,
      ),
      home: const ProjectListScreen(),
    );
  }
}


class ProjectListScreen extends StatelessWidget {
  const ProjectListScreen({Key? key}) : super(key: key);

  
  final List<Map<String, String>> projects = const [
    {
      "title": "AI-Powered Chatbot",
      "subtitle": "A smart assistant for college queries",
      "team": "Team Innovators",
    },
    {
      "title": "Smart Attendance System",
      "subtitle": "Face recognition-based attendance",
      "team": "Visionaries",
    },
    {
      "title": "E-Waste Management App",
      "subtitle": "Tracking and recycling made easy",
      "team": "Green Techies",
    },
    {
      "title": "Health Monitoring IoT Device",
      "subtitle": "Real-time health tracking wearable",
      "team": "MediCare Team",
    },
    {
      "title": "Virtual Reality Tour",
      "subtitle": "Immersive 360° campus navigation",
      "team": "VR Squad",
    },
    {
      "title": "Smart Irrigation System",
      "subtitle": "IoT solution for farmers",
      "team": "AgroTech",
    },
    {
      "title": "Cybersecurity Analyzer",
      "subtitle": "Detect phishing and malware threats",
      "team": "Cyber Warriors",
    },
    {
      "title": "Blockchain Voting System",
      "subtitle": "Transparent and secure e-voting",
      "team": "ChainCoders",
    },
    {
      "title": "Language Learning App",
      "subtitle": "AI-driven speech recognition tutor",
      "team": "LinguaMasters",
    },
    {
      "title": "Autonomous Delivery Robot",
      "subtitle": "Last-mile delivery with robotics",
      "team": "RoboRiders",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Project Exhibition"),
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return MyListItem(
            title: project["title"]!,
            subtitle: project["subtitle"]!,
            team: project["team"]!,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProjectDetailScreen(project: project),
                ),
              );
            },
          );
        },
      ),
    );
  }
}


class ProjectDetailScreen extends StatelessWidget {
  final Map<String, String> project;

  const ProjectDetailScreen({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(project["title"]!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project["title"]!,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  project["subtitle"]!,
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
                const SizedBox(height: 20),
                Text(
                  "Presented by: ${project["team"]!}",
                  style: const TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
