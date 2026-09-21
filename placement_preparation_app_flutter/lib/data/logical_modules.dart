import '../models/module.dart';
import '../models/question.dart';

class LogicalModules {
  static const List<PlacementModule> modules = [
    PlacementModule(
      id: 21,
      day: 21,
      title: 'Number Series',
      category: 'Logical Reasoning',
      icon: '🔢',
      definition:
          'Number series questions contain a sequence of numbers following a particular logical pattern.',
      formula:
          'Check common differences, multiplication, division, squares, cubes, or alternating patterns.',
      example:
          'Find the next number: 2, 4, 6, 8, ?. Each number increases by 2, so the answer is 10.',
      explanation:
          'Compare consecutive numbers and identify the simplest repeating pattern.',
      questions: [
        Question(
          question: 'Find the next number: 2, 4, 6, 8, ?',
          options: ['9', '10', '11', '12'],
          answerIndex: 1,
          explanation: 'The numbers increase by 2, so the next number is 10.',
        ),
        Question(
          question: 'Find the next number: 5, 10, 15, 20, ?',
          options: ['22', '24', '25', '30'],
          answerIndex: 2,
          explanation: 'Each number increases by 5.',
        ),
        Question(
          question: 'Find the next number: 3, 6, 12, 24, ?',
          options: ['36', '42', '48', '50'],
          answerIndex: 2,
          explanation: 'Each number is multiplied by 2.',
        ),
        Question(
          question: 'Find the next number: 10, 20, 30, 40, ?',
          options: ['45', '50', '55', '60'],
          answerIndex: 1,
          explanation: 'Each number increases by 10.',
        ),
        Question(
          question: 'Find the next number: 1, 4, 9, 16, ?',
          options: ['20', '24', '25', '30'],
          answerIndex: 2,
          explanation: 'These are square numbers: 1², 2², 3², 4², 5².',
        ),
      ],
    ),

    PlacementModule(
      id: 22,
      day: 22,
      title: 'Coding-Decoding',
      category: 'Logical Reasoning',
      icon: '🔐',
      definition:
          'Coding-decoding questions use a specific rule to replace letters or words with other symbols or letters.',
      formula:
          'Identify the transformation rule and apply the same rule to the given word.',
      example:
          'If CAT is coded as DBU, each letter is moved one position forward in the alphabet.',
      explanation:
          'Compare the original and coded forms carefully to discover the pattern.',
      questions: [
        Question(
          question: 'If CAT is coded as DBU, how is DOG coded?',
          options: ['EPH', 'EOG', 'DPH', 'FQI'],
          answerIndex: 0,
          explanation: 'Each letter moves one position forward: D→E, O→P, G→H.',
        ),
        Question(
          question: 'If A = 1, B = 2, C = 3, what is the value of D?',
          options: ['2', '3', '4', '5'],
          answerIndex: 2,
          explanation: 'D is the fourth letter of the alphabet.',
        ),
        Question(
          question: 'If BOOK is coded by moving each letter one step forward, the first letter becomes:',
          options: ['A', 'B', 'C', 'D'],
          answerIndex: 2,
          explanation: 'B moves one position forward to C.',
        ),
        Question(
          question: 'If PEN becomes QFO, the coding rule is:',
          options: [
            'Move each letter one step forward',
            'Move each letter one step backward',
            'Reverse the word',
            'Swap vowels'
          ],
          answerIndex: 0,
          explanation: 'P→Q, E→F and N→O.',
        ),
        Question(
          question: 'Which letter comes immediately after M?',
          options: ['L', 'N', 'O', 'P'],
          answerIndex: 1,
          explanation: 'N comes immediately after M.',
        ),
      ],
    ),

    PlacementModule(
      id: 23,
      day: 23,
      title: 'Blood Relations',
      category: 'Logical Reasoning',
      icon: '👨‍👩‍👧',
      definition:
          'Blood relation problems test relationships between family members using statements and clues.',
      formula:
          'Map each person and relationship step by step to identify the required relation.',
      example:
          'A is the brother of B. B is the sister of C. Therefore, A and C are siblings.',
      explanation:
          'Draw a small family tree whenever the relationship becomes complicated.',
      questions: [
        Question(
          question: 'A is the brother of B. What is B to A?',
          options: ['Brother', 'Sister', 'Father', 'Mother'],
          answerIndex: 1,
          explanation: 'If A is B’s brother, B is A’s sister.',
        ),
        Question(
          question: 'Your father’s brother is your:',
          options: ['Cousin', 'Uncle', 'Nephew', 'Grandfather'],
          answerIndex: 1,
          explanation: 'Your father’s brother is your paternal uncle.',
        ),
        Question(
          question: 'Your mother’s mother is your:',
          options: ['Aunt', 'Grandmother', 'Sister', 'Cousin'],
          answerIndex: 1,
          explanation: 'Your mother’s mother is your maternal grandmother.',
        ),
        Question(
          question: 'Your brother’s sister is your:',
          options: ['Mother', 'Aunt', 'Sister', 'Cousin'],
          answerIndex: 2,
          explanation: 'Your brother’s sister can be your sister.',
        ),
        Question(
          question: 'Your father’s father is your:',
          options: ['Uncle', 'Grandfather', 'Brother', 'Cousin'],
          answerIndex: 1,
          explanation: 'Your father’s father is your grandfather.',
        ),
      ],
    ),

    PlacementModule(
      id: 24,
      day: 24,
      title: 'Direction Sense',
      category: 'Logical Reasoning',
      icon: '🧭',
      definition:
          'Direction sense questions test the ability to determine directions and positions after movements.',
      formula:
          'North is opposite South, and East is opposite West.',
      example:
          'If you move 5 m north and then 5 m south, you return to your starting position.',
      explanation:
          'Track every movement using a simple direction diagram or coordinates.',
      questions: [
        Question(
          question: 'Which direction is opposite to North?',
          options: ['East', 'West', 'South', 'North-East'],
          answerIndex: 2,
          explanation: 'South is directly opposite North.',
        ),
        Question(
          question: 'Which direction is opposite to East?',
          options: ['North', 'South', 'West', 'North-East'],
          answerIndex: 2,
          explanation: 'West is directly opposite East.',
        ),
        Question(
          question: 'If you face North and turn right, you face:',
          options: ['West', 'East', 'South', 'North'],
          answerIndex: 1,
          explanation: 'A right turn from North points East.',
        ),
        Question(
          question: 'If you face East and turn left, you face:',
          options: ['North', 'South', 'West', 'East'],
          answerIndex: 0,
          explanation: 'A left turn from East points North.',
        ),
        Question(
          question: 'Which direction lies between North and East?',
          options: ['South-East', 'North-East', 'South-West', 'North-West'],
          answerIndex: 1,
          explanation: 'North-East lies between North and East.',
        ),
      ],
    ),

    PlacementModule(
      id: 25,
      day: 25,
      title: 'Syllogisms',
      category: 'Logical Reasoning',
      icon: '🧠',
      definition:
          'Syllogism questions contain statements and conclusions that must be logically evaluated.',
      formula:
          'Use only the information given in the statements; do not add outside assumptions.',
      example:
          'All cats are animals. All animals need food. Therefore, all cats need food.',
      explanation:
          'Connect the statements logically and check whether the conclusion must be true.',
      questions: [
        Question(
          question:
              'All roses are flowers. All flowers are plants. Therefore, all roses are:',
          options: ['Trees', 'Plants', 'Animals', 'Fruits'],
          answerIndex: 1,
          explanation: 'If roses are flowers and flowers are plants, roses are plants.',
        ),
        Question(
          question:
              'All dogs are animals. Bruno is a dog. Therefore Bruno is:',
          options: ['A plant', 'An animal', 'A bird', 'A fish'],
          answerIndex: 1,
          explanation: 'Bruno belongs to the group of dogs, and all dogs are animals.',
        ),
        Question(
          question:
              'All students are learners. Ravi is a student. Ravi is a:',
          options: ['Teacher', 'Learner', 'Doctor', 'Driver'],
          answerIndex: 1,
          explanation: 'Ravi is a student, and all students are learners.',
        ),
        Question(
          question:
              'All books are useful. This object is a book. Therefore it is:',
          options: ['Useful', 'A vehicle', 'A person', 'A building'],
          answerIndex: 0,
          explanation: 'The conclusion follows directly from the statements.',
        ),
        Question(
          question:
              'All birds have wings. A sparrow is a bird. A sparrow has:',
          options: ['Fins', 'Wings', 'Wheels', 'Roots'],
          answerIndex: 1,
          explanation: 'A sparrow is a bird, so according to the statement it has wings.',
        ),
      ],
    ),

    PlacementModule(
      id: 26,
      day: 26,
      title: 'Analogies',
      category: 'Logical Reasoning',
      icon: '🔗',
      definition:
          'Analogy questions identify a relationship between two objects and apply the same relationship to another pair.',
      formula:
          'A:B :: C:D means the relationship between A and B is similar to C and D.',
      example:
          'Bird : Fly :: Fish : Swim. Flying is associated with birds just as swimming is associated with fish.',
      explanation:
          'First identify the exact relationship in the first pair, then find the matching option.',
      questions: [
        Question(
          question: 'Bird : Fly :: Fish : ?',
          options: ['Run', 'Swim', 'Walk', 'Jump'],
          answerIndex: 1,
          explanation: 'Birds fly and fish swim.',
        ),
        Question(
          question: 'Pen : Write :: Knife : ?',
          options: ['Cut', 'Read', 'Sleep', 'Run'],
          answerIndex: 0,
          explanation: 'A pen is used to write and a knife is used to cut.',
        ),
        Question(
          question: 'Doctor : Hospital :: Teacher : ?',
          options: ['Court', 'School', 'Market', 'Airport'],
          answerIndex: 1,
          explanation: 'A doctor commonly works in a hospital and a teacher in a school.',
        ),
        Question(
          question: 'Book : Read :: Food : ?',
          options: ['Eat', 'Write', 'Drive', 'Build'],
          answerIndex: 0,
          explanation: 'Books are read and food is eaten.',
        ),
        Question(
          question: 'Eye : See :: Ear : ?',
          options: ['Taste', 'Touch', 'Hear', 'Smell'],
          answerIndex: 2,
          explanation: 'The eye is used for seeing and the ear for hearing.',
        ),
      ],
    ),

    PlacementModule(
      id: 27,
      day: 27,
      title: 'Seating Arrangement',
      category: 'Logical Reasoning',
      icon: '🪑',
      definition:
          'Seating arrangement problems require arranging people according to given positional conditions.',
      formula:
          'Fix a reference position first and place other people using the given clues.',
      example:
          'If A sits to the left of B, B must be immediately to the right of A in a simple linear arrangement.',
      explanation:
          'Draw positions as boxes and fill them one clue at a time.',
      questions: [
        Question(
          question: 'If A sits to the left of B, who is on the right?',
          options: ['A', 'B', 'Both', 'Neither'],
          answerIndex: 1,
          explanation: 'B is positioned to the right of A.',
        ),
        Question(
          question: 'In a row, C is between A and B. Which statement is true?',
          options: [
            'C is at an end',
            'C is between A and B',
            'A is between C and B',
            'B is outside the row'
          ],
          answerIndex: 1,
          explanation: 'The statement directly says C is between A and B.',
        ),
        Question(
          question: 'If P sits immediately right of Q, then Q is:',
          options: ['Right of P', 'Left of P', 'Above P', 'Below P'],
          answerIndex: 1,
          explanation: 'If P is right of Q, Q is left of P.',
        ),
        Question(
          question: 'In a row of 5 people, the middle position is:',
          options: ['1st', '2nd', '3rd', '4th'],
          answerIndex: 2,
          explanation: 'The third position is the middle of five positions.',
        ),
        Question(
          question: 'If X is at the left end of a row, X is in position:',
          options: ['1st', '2nd', 'Middle', 'Last'],
          answerIndex: 0,
          explanation: 'The left end is the first position.',
        ),
      ],
    ),

    PlacementModule(
      id: 28,
      day: 28,
      title: 'Puzzles',
      category: 'Logical Reasoning',
      icon: '🧩',
      definition:
          'Logical puzzles combine multiple clues to determine a unique arrangement, relationship, or answer.',
      formula:
          'List the clues, identify fixed information, eliminate impossible possibilities, and derive the answer.',
      example:
          'If A is older than B and B is older than C, then A is older than C.',
      explanation:
          'Break a complex puzzle into smaller relationships and solve them systematically.',
      questions: [
        Question(
          question: 'A is taller than B. B is taller than C. Who is tallest?',
          options: ['A', 'B', 'C', 'Cannot say'],
          answerIndex: 0,
          explanation: 'A is taller than B, and B is taller than C.',
        ),
        Question(
          question: 'If Monday comes before Tuesday, which comes later?',
          options: ['Monday', 'Tuesday', 'Sunday', 'Saturday'],
          answerIndex: 1,
          explanation: 'Tuesday comes after Monday.',
        ),
        Question(
          question: 'A is older than B. B is older than C. Who is youngest?',
          options: ['A', 'B', 'C', 'Cannot say'],
          answerIndex: 2,
          explanation: 'C is younger than B, and B is younger than A.',
        ),
        Question(
          question: 'If red is before blue and blue is before green, which is last?',
          options: ['Red', 'Blue', 'Green', 'None'],
          answerIndex: 2,
          explanation: 'The order is red, blue, green.',
        ),
        Question(
          question: 'If P is heavier than Q and Q is heavier than R, who is lightest?',
          options: ['P', 'Q', 'R', 'Cannot say'],
          answerIndex: 2,
          explanation: 'R is lighter than Q and P.',
        ),
      ],
    ),

    PlacementModule(
      id: 29,
      day: 29,
      title: 'Data Sufficiency',
      category: 'Logical Reasoning',
      icon: '📋',
      definition:
          'Data sufficiency questions ask whether the given information is enough to answer a question.',
      formula:
          'Check whether each statement alone or together provides sufficient information.',
      example:
          'Question: Is A greater than B? Statement 1: A = 10. Statement 2: B = 5. Together they are sufficient.',
      explanation:
          'Do not calculate more than necessary. The goal is to determine whether the data is sufficient.',
      questions: [
        Question(
          question: 'To find x, if x = 10 is directly given, is the data sufficient?',
          options: ['Yes', 'No', 'Only sometimes', 'Cannot determine'],
          answerIndex: 0,
          explanation: 'The value of x is directly known.',
        ),
        Question(
          question: 'If a question asks whether A > B and gives A = 10, B = 5, is it sufficient?',
          options: ['Yes', 'No', 'Only A is sufficient', 'Only B is sufficient'],
          answerIndex: 0,
          explanation: 'Both values are known, so the comparison is possible.',
        ),
        Question(
          question: 'If only A = 10 is known and B is unknown, can A > B always be determined?',
          options: ['Yes', 'No', 'Always', 'Only if A is positive'],
          answerIndex: 1,
          explanation: 'Without knowing B, the comparison cannot always be determined.',
        ),
        Question(
          question: 'Data sufficiency mainly tests:',
          options: [
            'Speed of typing',
            'Whether information is enough',
            'Vocabulary',
            'Memory only'
          ],
          answerIndex: 1,
          explanation: 'The purpose is to check whether the provided information is sufficient.',
        ),
        Question(
          question: 'In data sufficiency, unnecessary calculation should be:',
          options: ['Increased', 'Avoided', 'Always repeated', 'Ignored completely'],
          answerIndex: 1,
          explanation: 'Only sufficiency needs to be determined.',
        ),
      ],
    ),

    PlacementModule(
      id: 30,
      day: 30,
      title: 'Statement & Conclusions',
      category: 'Logical Reasoning',
      icon: '💡',
      definition:
          'Statement and conclusion questions test whether a conclusion logically follows from a given statement.',
      formula:
          'A conclusion follows only when it can be logically supported by the statement.',
      example:
          'Statement: All employees must carry ID cards. Conclusion: Employees need ID cards. This follows from the statement.',
      explanation:
          'Use only the information in the statement and avoid assumptions based on outside knowledge.',
      questions: [
        Question(
          question:
              'Statement: All students must attend the exam. Conclusion: Students must attend the exam. Does it follow?',
          options: ['Yes', 'No', 'Cannot say', 'Only sometimes'],
          answerIndex: 0,
          explanation: 'The conclusion directly restates the statement.',
        ),
        Question(
          question:
              'Statement: Some books are new. Conclusion: All books are new. Does it follow?',
          options: ['Yes', 'No', 'Definitely', 'Always'],
          answerIndex: 1,
          explanation: 'Some books being new does not mean all books are new.',
        ),
        Question(
          question:
              'Statement: All managers are employees. Conclusion: Some employees are managers. Does it follow?',
          options: ['Yes', 'No', 'Impossible', 'None'],
          answerIndex: 0,
          explanation:
              'If managers exist, they are employees, so managers form a group within employees.',
        ),
        Question(
          question:
              'Statement: No cats are dogs. Conclusion: No dogs are cats. Does it follow?',
          options: ['Yes', 'No', 'Cannot say', 'Only sometimes'],
          answerIndex: 0,
          explanation: 'The relationship is symmetric: cats and dogs do not overlap.',
        ),
        Question(
          question:
              'Statement: Some students play cricket. Conclusion: All students play cricket.',
          options: ['Yes', 'No', 'Always', 'Definitely'],
          answerIndex: 1,
          explanation: 'Some students playing cricket does not imply all students do.',
        ),
      ],
    ),
  ];
}