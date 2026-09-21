import '../models/module.dart';
import '../models/question.dart';

class VerbalModules {
  static const List<PlacementModule> modules = [
    PlacementModule(
      id: 1,
      day: 1,
      title: 'Vocabulary',
      category: 'Verbal Ability',
      icon: '📚',
      definition:
          'Vocabulary is the collection of words a person understands and uses while communicating.',
      formula: 'Word Meaning = Context + Usage + Synonym/Antonym',
      example:
          'The word "rapid" means fast or quick. In a sentence: "The company experienced rapid growth."',
      explanation:
          'Learn new words with their meanings, synonyms, antonyms and example sentences. Context helps you understand the correct meaning.',
      questions: [
        Question(
          question: 'What is the meaning of "rapid"?',
          options: ['Slow', 'Fast', 'Weak', 'Small'],
          answerIndex: 1,
          explanation: 'Rapid means very fast or quick.',
        ),
        Question(
          question: 'What does "ancient" mean?',
          options: ['Very old', 'Very new', 'Very large', 'Very easy'],
          answerIndex: 0,
          explanation: 'Ancient refers to something belonging to a very old time.',
        ),
        Question(
          question: 'What is the meaning of "brief"?',
          options: ['Long', 'Short', 'Difficult', 'Expensive'],
          answerIndex: 1,
          explanation: 'Brief means short in duration or length.',
        ),
        Question(
          question: 'What does "accurate" mean?',
          options: ['Correct', 'Fast', 'Heavy', 'Funny'],
          answerIndex: 0,
          explanation: 'Accurate means correct or free from errors.',
        ),
        Question(
          question: 'What is the meaning of "assist"?',
          options: ['Help', 'Stop', 'Ignore', 'Destroy'],
          answerIndex: 0,
          explanation: 'Assist means to help someone.',
        ),
      ],
    ),

    PlacementModule(
      id: 2,
      day: 2,
      title: 'Synonyms & Antonyms',
      category: 'Verbal Ability',
      icon: '🔤',
      definition:
          'Synonyms are words with similar meanings, while antonyms are words with opposite meanings.',
      formula: 'Synonym = Similar Meaning\nAntonym = Opposite Meaning',
      example:
          'Happy → Joyful is a synonym. Happy → Sad is an antonym.',
      explanation:
          'In placement tests, identify the meaning of the given word first and then select the closest or opposite word.',
      questions: [
        Question(
          question: 'Choose the synonym of "happy".',
          options: ['Sad', 'Joyful', 'Angry', 'Weak'],
          answerIndex: 1,
          explanation: 'Joyful has a meaning similar to happy.',
        ),
        Question(
          question: 'Choose the antonym of "strong".',
          options: ['Powerful', 'Weak', 'Brave', 'Active'],
          answerIndex: 1,
          explanation: 'Weak is the opposite of strong.',
        ),
        Question(
          question: 'Choose the synonym of "begin".',
          options: ['End', 'Start', 'Stop', 'Close'],
          answerIndex: 1,
          explanation: 'Start means to begin.',
        ),
        Question(
          question: 'Choose the antonym of "ancient".',
          options: ['Old', 'Modern', 'Historic', 'Past'],
          answerIndex: 1,
          explanation: 'Modern is the opposite of ancient.',
        ),
        Question(
          question: 'Choose the synonym of "large".',
          options: ['Tiny', 'Small', 'Huge', 'Short'],
          answerIndex: 2,
          explanation: 'Huge means very large.',
        ),
      ],
    ),

    PlacementModule(
      id: 3,
      day: 3,
      title: 'Grammar',
      category: 'Verbal Ability',
      icon: '📝',
      definition:
          'Grammar is the set of rules that determines how words are arranged to form correct sentences.',
      formula: 'Correct Sentence = Subject + Verb + Appropriate Structure',
      example:
          'Incorrect: "She go to college."\nCorrect: "She goes to college."',
      explanation:
          'Focus on subject-verb agreement, tenses, articles, prepositions and sentence structure.',
      questions: [
        Question(
          question: 'Choose the correct sentence.',
          options: [
            'He go to school.',
            'He goes to school.',
            'He going school.',
            'He gone school.'
          ],
          answerIndex: 1,
          explanation: 'With "He", the present-tense verb is "goes".',
        ),
        Question(
          question: 'Choose the correct article: "I saw ___ elephant."',
          options: ['a', 'an', 'the', 'no article'],
          answerIndex: 1,
          explanation: 'Elephant begins with a vowel sound, so "an" is used.',
        ),
        Question(
          question: 'Which is a verb?',
          options: ['Beautiful', 'Quickly', 'Run', 'Table'],
          answerIndex: 2,
          explanation: 'Run is an action verb.',
        ),
        Question(
          question: 'Choose the correct sentence.',
          options: [
            'They is ready.',
            'They are ready.',
            'They am ready.',
            'They be ready.'
          ],
          answerIndex: 1,
          explanation: 'The plural subject "They" takes "are".',
        ),
        Question(
          question: 'Which word is a noun?',
          options: ['Run', 'Beautiful', 'Computer', 'Quickly'],
          answerIndex: 2,
          explanation: 'Computer is a noun because it names an object.',
        ),
      ],
    ),

    PlacementModule(
      id: 4,
      day: 4,
      title: 'Sentence Correction',
      category: 'Verbal Ability',
      icon: '✏️',
      definition:
          'Sentence correction involves identifying grammatical or structural errors and selecting the correct form.',
      formula: 'Correction = Identify Error → Apply Grammar Rule → Correct Sentence',
      example:
          'Incorrect: "She have a book."\nCorrect: "She has a book."',
      explanation:
          'Check subject-verb agreement, tense, articles, prepositions and word usage.',
      questions: [
        Question(
          question: 'Choose the correct sentence.',
          options: [
            'She have a car.',
            'She has a car.',
            'She having a car.',
            'She had has a car.'
          ],
          answerIndex: 1,
          explanation: '"She" takes "has" in the present tense.',
        ),
        Question(
          question: 'Choose the correct form.',
          options: [
            'He do his work.',
            'He does his work.',
            'He doing his work.',
            'He done his work.'
          ],
          answerIndex: 1,
          explanation: '"He" takes "does" in the simple present.',
        ),
        Question(
          question: 'Choose the correct sentence.',
          options: [
            'I am interested in coding.',
            'I am interested on coding.',
            'I interested in coding.',
            'I am interest coding.'
          ],
          answerIndex: 0,
          explanation: 'The correct preposition is "in".',
        ),
        Question(
          question: 'Choose the correct sentence.',
          options: [
            'They was happy.',
            'They were happy.',
            'They is happy.',
            'They be happy.'
          ],
          answerIndex: 1,
          explanation: '"They" takes "were" in the past tense.',
        ),
        Question(
          question: 'Choose the correct sentence.',
          options: [
            'She is good in mathematics.',
            'She is good at mathematics.',
            'She good at mathematics.',
            'She is well at mathematics.'
          ],
          answerIndex: 1,
          explanation: 'The standard expression is "good at".',
        ),
      ],
    ),

    PlacementModule(
      id: 5,
      day: 5,
      title: 'Error Spotting',
      category: 'Verbal Ability',
      icon: '🔎',
      definition:
          'Error spotting questions require finding grammatical mistakes in a sentence.',
      formula: 'Spot Error → Identify Rule → Select Incorrect Part',
      example:
          '"He go to office every day" contains an error because "He" requires "goes".',
      explanation:
          'Read the complete sentence first. Then check subject-verb agreement, tense, articles and prepositions.',
      questions: [
        Question(
          question: 'Find the error: "She go to college every day."',
          options: [
            'She',
            'go',
            'college',
            'every day'
          ],
          answerIndex: 1,
          explanation: '"Go" should be "goes".',
        ),
        Question(
          question: 'Find the error: "They is ready."',
          options: [
            'They',
            'is',
            'ready',
            'No error'
          ],
          answerIndex: 1,
          explanation: '"They" should be followed by "are".',
        ),
        Question(
          question: 'Find the error: "He is good in mathematics."',
          options: [
            'He',
            'is',
            'good in',
            'mathematics'
          ],
          answerIndex: 2,
          explanation: 'The standard phrase is "good at mathematics".',
        ),
        Question(
          question: 'Find the error: "I has completed the work."',
          options: [
            'I',
            'has',
            'completed',
            'work'
          ],
          answerIndex: 1,
          explanation: '"I" takes "have", not "has".',
        ),
        Question(
          question: 'Find the error: "She were absent yesterday."',
          options: [
            'She',
            'were',
            'absent',
            'yesterday'
          ],
          answerIndex: 1,
          explanation: '"She" takes "was" in the past tense.',
        ),
      ],
    ),

    PlacementModule(
      id: 6,
      day: 6,
      title: 'Fill in the Blanks',
      category: 'Verbal Ability',
      icon: '🧩',
      definition:
          'Fill in the blanks questions test vocabulary, grammar and understanding of sentence context.',
      formula: 'Context → Grammar/Vocabulary → Best-Fit Word',
      example:
          'She ___ to college every day. → goes',
      explanation:
          'Read the entire sentence and identify what type of word is required before selecting the option.',
      questions: [
        Question(
          question: 'She ___ to college every day.',
          options: ['go', 'goes', 'going', 'gone'],
          answerIndex: 1,
          explanation: '"She" takes "goes" in the simple present.',
        ),
        Question(
          question: 'He is ___ honest person.',
          options: ['a', 'an', 'the', 'no article'],
          answerIndex: 1,
          explanation: 'Honest begins with a vowel sound, so "an" is used.',
        ),
        Question(
          question: 'They ___ playing cricket now.',
          options: ['is', 'are', 'was', 'be'],
          answerIndex: 1,
          explanation: '"They" takes "are".',
        ),
        Question(
          question: 'I am interested ___ programming.',
          options: ['on', 'at', 'in', 'for'],
          answerIndex: 2,
          explanation: 'The correct expression is "interested in".',
        ),
        Question(
          question: 'The opposite of "difficult" is ___.',
          options: ['Hard', 'Easy', 'Strong', 'Heavy'],
          answerIndex: 1,
          explanation: 'Easy is the opposite of difficult.',
        ),
      ],
    ),

    PlacementModule(
      id: 7,
      day: 7,
      title: 'Reading Comprehension',
      category: 'Verbal Ability',
      icon: '📖',
      definition:
          'Reading comprehension tests the ability to understand, interpret and answer questions about a passage.',
      formula: 'Read → Understand → Locate Evidence → Answer',
      example:
          'Read the passage carefully and identify the main idea before answering detailed questions.',
      explanation:
          'Do not rely only on assumptions. Use information stated or clearly implied by the passage.',
      questions: [
        Question(
          question:
              'Passage: "Trees provide oxygen and help reduce pollution." What is the main idea?',
          options: [
            'Trees are harmful.',
            'Trees provide environmental benefits.',
            'Trees are expensive.',
            'Trees grow only in cities.'
          ],
          answerIndex: 1,
          explanation: 'The passage describes environmental benefits of trees.',
        ),
        Question(
          question: 'What should you identify first in a passage?',
          options: [
            'Main idea',
            'Last word',
            'Longest sentence',
            'Punctuation only'
          ],
          answerIndex: 0,
          explanation: 'Finding the main idea helps understand the passage.',
        ),
        Question(
          question: 'A factual answer should be based on:',
          options: [
            'The passage',
            'Guesswork',
            'Personal preference',
            'Random choice'
          ],
          answerIndex: 0,
          explanation: 'Answers should be supported by the passage.',
        ),
        Question(
          question: 'What can headings help identify?',
          options: [
            'Topic',
            'Grammar only',
            'Spelling only',
            'Number of letters'
          ],
          answerIndex: 0,
          explanation: 'Headings often indicate the topic or main subject.',
        ),
        Question(
          question: 'Good comprehension requires:',
          options: [
            'Careful reading',
            'Skipping the passage',
            'Guessing every answer',
            'Reading only the options'
          ],
          answerIndex: 0,
          explanation: 'Careful reading improves understanding and accuracy.',
        ),
      ],
    ),

    PlacementModule(
      id: 8,
      day: 8,
      title: 'Para Jumbles',
      category: 'Verbal Ability',
      icon: '🔀',
      definition:
          'Para jumbles require arranging sentences in a logical and meaningful order.',
      formula: 'Opening Idea → Connecting Sentence → Supporting Details → Conclusion',
      example:
          'A general introduction usually comes before specific examples or conclusions.',
      explanation:
          'Look for introductory sentences, pronouns, connecting words and logical sequences.',
      questions: [
        Question(
          question: 'In a paragraph, which sentence usually comes first?',
          options: [
            'A clear introductory sentence',
            'A conclusion',
            'A pronoun with no reference',
            'A random example'
          ],
          answerIndex: 0,
          explanation: 'An introduction normally establishes the topic.',
        ),
        Question(
          question: 'Words such as "therefore" often indicate:',
          options: [
            'A conclusion or result',
            'An introduction',
            'A question',
            'A title'
          ],
          answerIndex: 0,
          explanation: '"Therefore" commonly introduces a result or conclusion.',
        ),
        Question(
          question: 'A pronoun such as "he" should normally refer to:',
          options: [
            'A previously mentioned person',
            'Nothing',
            'A future paragraph',
            'A punctuation mark'
          ],
          answerIndex: 0,
          explanation: 'Pronouns usually refer to an earlier noun or person.',
        ),
        Question(
          question: 'Para jumbles mainly test:',
          options: [
            'Logical sequence',
            'Typing speed',
            'Mathematical calculation',
            'Programming syntax'
          ],
          answerIndex: 0,
          explanation: 'The main skill is identifying logical sentence order.',
        ),
        Question(
          question: 'A conclusion generally appears:',
          options: [
            'At the end',
            'Before the introduction',
            'Randomly',
            'Always first'
          ],
          answerIndex: 0,
          explanation: 'A conclusion generally summarizes or closes the discussion.',
        ),
      ],
    ),

    PlacementModule(
      id: 9,
      day: 9,
      title: 'Idioms & Phrases',
      category: 'Verbal Ability',
      icon: '💬',
      definition:
          'Idioms are expressions whose overall meaning may differ from the literal meaning of their individual words.',
      formula: 'Idiom Meaning ≠ Always Literal Meaning',
      example:
          '"Break the ice" means to start a friendly conversation, not literally break ice.',
      explanation:
          'Learn common idioms with their meanings and example sentences.',
      questions: [
        Question(
          question: 'What does "break the ice" mean?',
          options: [
            'Start a friendly conversation',
            'Break frozen water',
            'Become angry',
            'Leave a place'
          ],
          answerIndex: 0,
          explanation: 'It means to start a relaxed or friendly interaction.',
        ),
        Question(
          question: 'What does "piece of cake" mean?',
          options: [
            'Very easy',
            'Very expensive',
            'Very dangerous',
            'Very large'
          ],
          answerIndex: 0,
          explanation: 'A piece of cake means something very easy.',
        ),
        Question(
          question: 'What does "once in a blue moon" mean?',
          options: [
            'Very rarely',
            'Every day',
            'Very quickly',
            'At night only'
          ],
          answerIndex: 0,
          explanation: 'It means something happens very rarely.',
        ),
        Question(
          question: 'What does "hit the nail on the head" mean?',
          options: [
            'Say or do exactly the right thing',
            'Make a mistake',
            'Start running',
            'Become tired'
          ],
          answerIndex: 0,
          explanation: 'It means to identify or express something exactly.',
        ),
        Question(
          question: 'What does "under the weather" generally mean?',
          options: [
            'Feeling unwell',
            'Standing outside',
            'Feeling excited',
            'Travelling'
          ],
          answerIndex: 0,
          explanation: 'It commonly means feeling ill or unwell.',
        ),
      ],
    ),

    PlacementModule(
      id: 10,
      day: 10,
      title: 'Verbal Reasoning',
      category: 'Verbal Ability',
      icon: '🧠',
      definition:
          'Verbal reasoning uses language, statements and relationships to reach logical conclusions.',
      formula: 'Information → Relationship → Logical Conclusion',
      example:
          'All engineers are graduates. Ravi is an engineer. Therefore, Ravi is a graduate.',
      explanation:
          'Read each statement carefully and use only the information provided to reach the conclusion.',
      questions: [
        Question(
          question:
              'All cats are animals. Tom is a cat. Therefore Tom is a:',
          options: ['Plant', 'Animal', 'Machine', 'Book'],
          answerIndex: 1,
          explanation: 'If all cats are animals and Tom is a cat, Tom is an animal.',
        ),
        Question(
          question:
              'All programmers use logic. Ravi is a programmer. Ravi uses:',
          options: ['Logic', 'Only numbers', 'Nothing', 'Music'],
          answerIndex: 0,
          explanation: 'The conclusion follows directly from the statements.',
        ),
        Question(
          question: 'If A is taller than B and B is taller than C, who is tallest?',
          options: ['A', 'B', 'C', 'Cannot say'],
          answerIndex: 0,
          explanation: 'A is taller than B, and B is taller than C.',
        ),
        Question(
          question:
              'If today is Monday, what day comes after two days?',
          options: ['Tuesday', 'Wednesday', 'Thursday', 'Friday'],
          answerIndex: 1,
          explanation: 'One day after Monday is Tuesday; two days after is Wednesday.',
        ),
        Question(
          question: 'Verbal reasoning mainly tests:',
          options: [
            'Logical thinking using language',
            'Typing speed',
            'Drawing ability',
            'Physical strength'
          ],
          answerIndex: 0,
          explanation: 'Verbal reasoning evaluates logical thinking through language.',
        ),
      ],
    ),
  ];
}