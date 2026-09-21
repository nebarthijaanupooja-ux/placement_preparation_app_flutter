import '../models/module.dart';
import '../models/question.dart';

class PlacementModules {
  static const List<PlacementModule> modules = [
    PlacementModule(
      id: 41,
      day: 41,
      title: 'Resume Building',
      category: 'Placement & Interview',
      icon: '📄',
      definition:
          'Resume building is the process of creating a clear and professional document that presents your education, skills, projects, achievements, and experience.',
      formula:
          'Strong Resume = Clear Format + Relevant Skills + Projects + Achievements',
      example:
          'Example: A fresher can include education, programming skills, academic projects, internships, certifications, and achievements.',
      explanation:
          'Keep your resume simple, relevant, and easy to read. Highlight skills and projects related to the job.',
      questions: [
        Question(
          question: 'What is the main purpose of a resume?',
          options: [
            'To present your qualifications',
            'To write a story',
            'To list hobbies only',
            'To replace an interview',
          ],
          answerIndex: 0,
          explanation:
              'A resume presents your education, skills, projects, experience, and achievements.',
        ),
        Question(
          question: 'Which section is important for a fresher?',
          options: [
            'Projects',
            'Favorite movies',
            'Daily routine',
            'Favorite food',
          ],
          answerIndex: 0,
          explanation:
              'Projects help demonstrate practical knowledge and skills.',
        ),
        Question(
          question: 'What should a resume generally be?',
          options: [
            'Clear and relevant',
            'Very confusing',
            'Only decorative',
            'Extremely long',
          ],
          answerIndex: 0,
          explanation:
              'A good resume should be clear, concise, and relevant to the position.',
        ),
        Question(
          question: 'Which can demonstrate technical ability?',
          options: [
            'Projects',
            'Nicknames',
            'Favorite songs',
            'Unrelated quotes',
          ],
          answerIndex: 0,
          explanation:
              'Technical projects provide evidence of practical skills.',
        ),
        Question(
          question: 'What should be avoided in a resume?',
          options: [
            'Unnecessary information',
            'Relevant skills',
            'Projects',
            'Education',
          ],
          answerIndex: 0,
          explanation:
              'Unnecessary information can make a resume less focused.',
        ),
      ],
    ),

    PlacementModule(
      id: 42,
      day: 42,
      title: 'Self Introduction',
      category: 'Placement & Interview',
      icon: '👋',
      definition:
          'Self introduction is a short and structured presentation of yourself during an interview or professional interaction.',
      formula:
          'Introduction = Name + Education + Skills + Projects + Career Goal',
      example:
          'Example: "I am a computer science student with an interest in software development. I have worked on academic projects using Python and Java."',
      explanation:
          'A good introduction should be brief, confident, relevant, and connected to the job role.',
      questions: [
        Question(
          question: 'What should a self-introduction mainly be?',
          options: [
            'Relevant and concise',
            'Very long',
            'Completely unrelated',
            'Only about hobbies',
          ],
          answerIndex: 0,
          explanation:
              'A professional introduction should focus on relevant information.',
        ),
        Question(
          question: 'Which can be included in a self-introduction?',
          options: [
            'Skills',
            'Private passwords',
            'Random jokes',
            'Unrelated gossip',
          ],
          answerIndex: 0,
          explanation:
              'Relevant skills can help the interviewer understand your profile.',
        ),
        Question(
          question: 'What is a useful part of an introduction?',
          options: [
            'Career goal',
            'Favorite celebrity',
            'Favorite food',
            'Unrelated story',
          ],
          answerIndex: 0,
          explanation:
              'A career goal helps connect your introduction with your professional direction.',
        ),
        Question(
          question: 'How should you deliver your introduction?',
          options: [
            'Clearly and confidently',
            'Very quietly',
            'Without preparation',
            'By reading unrelated text',
          ],
          answerIndex: 0,
          explanation:
              'Clear and confident communication creates a professional introduction.',
        ),
        Question(
          question: 'What should you avoid during self-introduction?',
          options: [
            'Unnecessary details',
            'Education',
            'Skills',
            'Projects',
          ],
          answerIndex: 0,
          explanation:
              'Keep the introduction focused on information relevant to the interview.',
        ),
      ],
    ),

    PlacementModule(
      id: 43,
      day: 43,
      title: 'HR Questions',
      category: 'Placement & Interview',
      icon: '💬',
      definition:
          'HR questions are interview questions used to understand a candidate’s background, communication, motivation, behavior, and career interests.',
      formula:
          'Good HR Answer = Relevant Point + Example + Clear Explanation',
      example:
          'Question: "Why should we hire you?" A useful answer connects your skills, projects, and willingness to learn with the job requirements.',
      explanation:
          'HR answers should be honest, structured, positive, and supported by examples when appropriate.',
      questions: [
        Question(
          question: 'What does HR commonly evaluate?',
          options: [
            'Communication and behavior',
            'Only typing speed',
            'Only handwriting',
            'Favorite games',
          ],
          answerIndex: 0,
          explanation:
              'HR interviews commonly explore communication, behavior, motivation, and career interests.',
        ),
        Question(
          question: 'How should you answer HR questions?',
          options: [
            'Honestly and clearly',
            'By memorizing random answers',
            'By avoiding every question',
            'By giving unrelated answers',
          ],
          answerIndex: 0,
          explanation:
              'Honest and clear answers help communicate your actual strengths and experiences.',
        ),
        Question(
          question: 'What can strengthen an interview answer?',
          options: [
            'A relevant example',
            'An unrelated story',
            'A random quote',
            'Silence',
          ],
          answerIndex: 0,
          explanation:
              'Relevant examples make answers more specific and understandable.',
        ),
        Question(
          question: 'Which question is common in HR interviews?',
          options: [
            'Tell me about yourself',
            'What is your favorite color?',
            'What did you eat yesterday?',
            'What is your phone wallpaper?',
          ],
          answerIndex: 0,
          explanation:
              '“Tell me about yourself” is a common introductory interview question.',
        ),
        Question(
          question: 'What should you avoid in HR answers?',
          options: [
            'False information',
            'Relevant examples',
            'Clear explanations',
            'Professional language',
          ],
          answerIndex: 0,
          explanation:
              'Providing false information can create problems during the hiring process.',
        ),
      ],
    ),

    PlacementModule(
      id: 44,
      day: 44,
      title: 'Communication Skills',
      category: 'Placement & Interview',
      icon: '🗣️',
      definition:
          'Communication skills are the abilities used to express ideas clearly, listen effectively, and interact professionally with others.',
      formula:
          'Effective Communication = Clear Message + Listening + Appropriate Response',
      example:
          'Example: During an interview, listen carefully to the question and answer it directly using clear language.',
      explanation:
          'Good communication includes speaking, listening, clarity, confidence, and appropriate professional behavior.',
      questions: [
        Question(
          question: 'What is an important part of communication?',
          options: [
            'Listening',
            'Interrupting',
            'Ignoring',
            'Guessing',
          ],
          answerIndex: 0,
          explanation:
              'Effective communication requires both speaking and listening.',
        ),
        Question(
          question: 'What makes a message effective?',
          options: [
            'Clarity',
            'Confusion',
            'Unrelated information',
            'Excessive repetition',
          ],
          answerIndex: 0,
          explanation:
              'Clear messages are easier for others to understand.',
        ),
        Question(
          question: 'What should you do when you do not understand a question?',
          options: [
            'Politely ask for clarification',
            'Give a random answer',
            'Ignore the question',
            'Leave immediately',
          ],
          answerIndex: 0,
          explanation:
              'Politely asking for clarification helps avoid misunderstandings.',
        ),
        Question(
          question: 'Which is useful in professional communication?',
          options: [
            'Appropriate language',
            'Insults',
            'Constant interruption',
            'Unrelated jokes',
          ],
          answerIndex: 0,
          explanation:
              'Professional communication should use respectful and appropriate language.',
        ),
        Question(
          question: 'Good communication involves:',
          options: [
            'Speaking and listening',
            'Speaking only',
            'Listening only',
            'Ignoring others',
          ],
          answerIndex: 0,
          explanation:
              'Effective communication involves both expressing and understanding information.',
        ),
      ],
    ),

    PlacementModule(
      id: 45,
      day: 45,
      title: 'Group Discussion',
      category: 'Placement & Interview',
      icon: '👥',
      definition:
          'A group discussion is a structured conversation where participants exchange ideas about a given topic.',
      formula:
          'Good GD = Relevant Ideas + Listening + Respect + Clear Communication',
      example:
          'Example: In a discussion about technology in education, a participant can present one clear point and support it with a suitable example.',
      explanation:
          'Participate actively while allowing others to speak. Build on useful points and avoid interrupting.',
      questions: [
        Question(
          question: 'What is important in a group discussion?',
          options: [
            'Listening to others',
            'Interrupting everyone',
            'Speaking continuously',
            'Ignoring the topic',
          ],
          answerIndex: 0,
          explanation:
              'Listening helps you understand and respond to other participants.',
        ),
        Question(
          question: 'A good GD contribution should be:',
          options: [
            'Relevant',
            'Completely unrelated',
            'Only one word',
            'Aggressive',
          ],
          answerIndex: 0,
          explanation:
              'Contributions should stay connected to the discussion topic.',
        ),
        Question(
          question: 'What should you avoid in a GD?',
          options: [
            'Personal attacks',
            'Relevant examples',
            'Respectful disagreement',
            'Listening',
          ],
          answerIndex: 0,
          explanation:
              'Personal attacks reduce the quality of professional discussion.',
        ),
        Question(
          question: 'What can support an argument?',
          options: [
            'A relevant example',
            'An unrelated joke',
            'Silence',
            'Personal attack',
          ],
          answerIndex: 0,
          explanation:
              'Relevant examples can make an argument clearer and more convincing.',
        ),
        Question(
          question: 'How should participants disagree?',
          options: [
            'Respectfully',
            'Aggressively',
            'By shouting',
            'By insulting others',
          ],
          answerIndex: 0,
          explanation:
              'Professional disagreement should remain respectful.',
        ),
      ],
    ),

    PlacementModule(
      id: 46,
      day: 46,
      title: 'Technical Interview',
      category: 'Placement & Interview',
      icon: '💻',
      definition:
          'A technical interview evaluates a candidate’s technical knowledge, problem-solving ability, programming concepts, and understanding of relevant subjects.',
      formula:
          'Technical Answer = Concept + Reasoning + Example',
      example:
          'Question: "What is an array?" A good answer defines an array and explains how it stores elements of the same data type in contiguous memory in typical implementations.',
      explanation:
          'Prepare core programming, data structures, algorithms, databases, operating systems, and networking concepts relevant to the role.',
      questions: [
        Question(
          question: 'What is commonly evaluated in a technical interview?',
          options: [
            'Technical knowledge',
            'Favorite food',
            'Clothing brand',
            'Favorite movie',
          ],
          answerIndex: 0,
          explanation:
              'Technical interviews evaluate knowledge related to the job and technical subjects.',
        ),
        Question(
          question: 'What is useful when answering a technical question?',
          options: [
            'Reasoning',
            'Guessing without explanation',
            'Changing the topic',
            'Ignoring the question',
          ],
          answerIndex: 0,
          explanation:
              'Explaining your reasoning demonstrates understanding of the concept.',
        ),
        Question(
          question: 'Which is commonly relevant for software roles?',
          options: [
            'Data structures',
            'Celebrity news',
            'Cooking recipes',
            'Fashion trends',
          ],
          answerIndex: 0,
          explanation:
              'Data structures are commonly relevant to software development and technical interviews.',
        ),
        Question(
          question: 'If you do not know an answer, what is appropriate?',
          options: [
            'Be honest and explain what you know',
            'Invent a technical fact',
            'Argue with the interviewer',
            'Ignore the question',
          ],
          answerIndex: 0,
          explanation:
              'Being honest while explaining related knowledge is more appropriate than inventing information.',
        ),
        Question(
          question: 'What can improve technical preparation?',
          options: [
            'Practicing concepts and problems',
            'Avoiding practice',
            'Memorizing random words',
            'Ignoring fundamentals',
          ],
          answerIndex: 0,
          explanation:
              'Regular practice helps strengthen both conceptual understanding and problem-solving.',
        ),
      ],
    ),

    PlacementModule(
      id: 47,
      day: 47,
      title: 'Behavioral Questions',
      category: 'Placement & Interview',
      icon: '🌱',
      definition:
          'Behavioral questions ask about past experiences to understand how a candidate handled situations, challenges, teamwork, and responsibilities.',
      formula:
          'STAR = Situation + Task + Action + Result',
      example:
          'Question: "Tell me about a challenge you faced." Explain the situation, your responsibility, the action you took, and the result.',
      explanation:
          'The STAR structure can help organize answers clearly and keep them focused on a specific experience.',
      questions: [
        Question(
          question: 'What does STAR stand for?',
          options: [
            'Situation, Task, Action, Result',
            'Skill, Test, Answer, Review',
            'Study, Think, Apply, Read',
            'Start, Talk, Ask, Repeat',
          ],
          answerIndex: 0,
          explanation:
              'STAR stands for Situation, Task, Action, and Result.',
        ),
        Question(
          question: 'Behavioral questions often focus on:',
          options: [
            'Past experiences',
            'Only mathematical formulas',
            'Only programming syntax',
            'Only vocabulary',
          ],
          answerIndex: 0,
          explanation:
              'Behavioral questions commonly ask about how you handled real situations.',
        ),
        Question(
          question: 'Which STAR part describes what you did?',
          options: [
            'Action',
            'Situation',
            'Task',
            'Result',
          ],
          answerIndex: 0,
          explanation:
              'Action explains the steps you personally took.',
        ),
        Question(
          question: 'Which STAR part describes the outcome?',
          options: [
            'Result',
            'Task',
            'Situation',
            'Action',
          ],
          answerIndex: 0,
          explanation:
              'Result describes what happened after the action.',
        ),
        Question(
          question: 'A good behavioral answer should be:',
          options: [
            'Specific and relevant',
            'Completely unrelated',
            'Only one word',
            'Invented',
          ],
          answerIndex: 0,
          explanation:
              'Specific and relevant examples make behavioral answers clearer.',
        ),
      ],
    ),

    PlacementModule(
      id: 48,
      day: 48,
      title: 'Mock Interview',
      category: 'Placement & Interview',
      icon: '🎤',
      definition:
          'A mock interview is a practice interview designed to simulate the interview environment and identify areas for improvement.',
      formula:
          'Mock Interview = Practice + Feedback + Improvement',
      example:
          'Example: A student answers HR and technical questions in a timed practice session and reviews the answers afterward.',
      explanation:
          'Mock interviews help practice communication, timing, question handling, and confidence before an actual interview.',
      questions: [
        Question(
          question: 'What is the purpose of a mock interview?',
          options: [
            'Practice interviewing',
            'Replace every real interview',
            'Avoid preparation',
            'Test handwriting',
          ],
          answerIndex: 0,
          explanation:
              'Mock interviews provide an opportunity to practice interview skills.',
        ),
        Question(
          question: 'What is useful after a mock interview?',
          options: [
            'Feedback',
            'Ignoring mistakes',
            'Stopping preparation',
            'Deleting all notes',
          ],
          answerIndex: 0,
          explanation:
              'Feedback helps identify areas that can be improved.',
        ),
        Question(
          question: 'Mock interviews can improve:',
          options: [
            'Interview practice',
            'Only handwriting',
            'Only typing',
            'Only drawing',
          ],
          answerIndex: 0,
          explanation:
              'Mock interviews provide practice with interview communication and question handling.',
        ),
        Question(
          question: 'Why can timing matter in a mock interview?',
          options: [
            'It simulates interview conditions',
            'It changes the candidate’s degree',
            'It replaces technical knowledge',
            'It removes all questions',
          ],
          answerIndex: 0,
          explanation:
              'Timing can make practice closer to real interview conditions.',
        ),
        Question(
          question: 'What should you do with mistakes found during practice?',
          options: [
            'Work on improving them',
            'Ignore them',
            'Hide them',
            'Repeat them intentionally',
          ],
          answerIndex: 0,
          explanation:
              'Identifying and improving mistakes is one of the main benefits of practice.',
        ),
      ],
    ),

    PlacementModule(
      id: 49,
      day: 49,
      title: 'Company Research',
      category: 'Placement & Interview',
      icon: '🏢',
      definition:
          'Company research is the process of learning about an organization, its products or services, technology, culture, roles, and hiring process.',
      formula:
          'Company Research = Company + Role + Products + Skills + Hiring Process',
      example:
          'Example: Before an interview, a candidate can learn about the company’s main products, technology areas, and the skills mentioned in the job description.',
      explanation:
          'Research should use reliable and current sources such as the company website and official job description.',
      questions: [
        Question(
          question: 'Why research a company before an interview?',
          options: [
            'To understand the organization and role',
            'To avoid answering questions',
            'To memorize unrelated facts',
            'To replace technical preparation',
          ],
          answerIndex: 0,
          explanation:
              'Research helps you understand the company and the position you are applying for.',
        ),
        Question(
          question: 'Which is a useful source for company information?',
          options: [
            'Official company website',
            'Random rumors',
            'Unverified messages',
            'Unrelated advertisements',
          ],
          answerIndex: 0,
          explanation:
              'The official company website is a useful primary source.',
        ),
        Question(
          question: 'What should you research about a job?',
          options: [
            'Required skills',
            'Only office decoration',
            'Only employee hobbies',
            'Unrelated celebrity news',
          ],
          answerIndex: 0,
          explanation:
              'Understanding required skills helps you prepare for the role.',
        ),
        Question(
          question: 'What can help you understand the role?',
          options: [
            'Job description',
            'Random social media comments',
            'Unrelated articles',
            'Old advertisements',
          ],
          answerIndex: 0,
          explanation:
              'The job description explains responsibilities and expected qualifications.',
        ),
        Question(
          question: 'Company research should ideally be:',
          options: [
            'Current and relevant',
            'Based only on rumors',
            'Completely unrelated',
            'Done after every interview only',
          ],
          answerIndex: 0,
          explanation:
              'Current and relevant information is more useful for interview preparation.',
        ),
      ],
    ),

    PlacementModule(
      id: 50,
      day: 50,
      title: 'Placement Strategy',
      category: 'Placement & Interview',
      icon: '🎯',
      definition:
          'Placement strategy is a structured approach to preparing for aptitude tests, technical assessments, interviews, and job applications.',
      formula:
          'Placement Preparation = Aptitude + Technical + Communication + Interview Practice',
      example:
          'Example: A student can create a weekly plan that includes aptitude practice, coding, technical revision, resume improvement, and mock interviews.',
      explanation:
          'Consistent preparation and progress tracking can help organize placement preparation effectively.',
      questions: [
        Question(
          question: 'What is an important part of placement preparation?',
          options: [
            'Consistent practice',
            'Last-minute preparation only',
            'Avoiding revision',
            'Ignoring interviews',
          ],
          answerIndex: 0,
          explanation:
              'Consistent practice helps build knowledge and problem-solving skills.',
        ),
        Question(
          question: 'Which combination is useful for placement preparation?',
          options: [
            'Aptitude and technical skills',
            'Only hobbies',
            'Only entertainment',
            'Only memorization',
          ],
          answerIndex: 0,
          explanation:
              'Aptitude and technical skills are commonly useful parts of placement preparation.',
        ),
        Question(
          question: 'Why track preparation progress?',
          options: [
            'To identify areas for improvement',
            'To avoid studying',
            'To delete completed work',
            'To replace practice',
          ],
          answerIndex: 0,
          explanation:
              'Progress tracking helps identify completed areas and topics that need more practice.',
        ),
        Question(
          question: 'What can a weekly preparation plan include?',
          options: [
            'Aptitude, coding, and interview practice',
            'Only entertainment',
            'Only one topic forever',
            'No revision',
          ],
          answerIndex: 0,
          explanation:
              'A balanced plan can include multiple placement-related preparation areas.',
        ),
        Question(
          question: 'What is useful before placement interviews?',
          options: [
            'Revision and mock practice',
            'Avoiding preparation',
            'Ignoring the job description',
            'Skipping technical topics',
          ],
          answerIndex: 0,
          explanation:
              'Revision and mock practice help you prepare for different parts of the placement process.',
        ),
      ],
    ),
  ];
}