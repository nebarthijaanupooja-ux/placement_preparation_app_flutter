import '../models/module.dart';
import '../models/question.dart';

class QuantitativeModules {
  static const List<PlacementModule> modules = [
    PlacementModule(
      id: 11,
      day: 11,
      title: 'Number System',
      category: 'Quantitative Aptitude',
      icon: '🔢',
      definition:
          'Number System deals with types of numbers, divisibility, factors, multiples, HCF and LCM.',
      formula:
          'For two numbers: HCF × LCM = Product of the two numbers.',
      example:
          'Find the HCF of 18 and 24. Factors of 18 are 1, 2, 3, 6, 9, 18. Factors of 24 are 1, 2, 3, 4, 6, 8, 12, 24. Highest common factor = 6.',
      explanation:
          'To find HCF, identify the greatest number that divides all given numbers exactly.',
      questions: [
        Question(
          question: 'What is the HCF of 12 and 18?',
          options: ['2', '3', '6', '9'],
          answerIndex: 2,
          explanation: 'The highest common factor of 12 and 18 is 6.',
        ),
        Question(
          question: 'What is the LCM of 4 and 6?',
          options: ['8', '10', '12', '24'],
          answerIndex: 2,
          explanation: 'The smallest common multiple of 4 and 6 is 12.',
        ),
        Question(
          question: 'Which number is prime?',
          options: ['21', '27', '29', '33'],
          answerIndex: 2,
          explanation: '29 has only two factors: 1 and 29.',
        ),
        Question(
          question: 'What is the remainder when 17 is divided by 5?',
          options: ['1', '2', '3', '4'],
          answerIndex: 1,
          explanation: '5 × 3 = 15, so the remainder is 2.',
        ),
        Question(
          question: 'Which is an even number?',
          options: ['17', '21', '35', '42'],
          answerIndex: 3,
          explanation: '42 is divisible by 2, so it is even.',
        ),
      ],
    ),

    PlacementModule(
      id: 12,
      day: 12,
      title: 'Percentages',
      category: 'Quantitative Aptitude',
      icon: '📊',
      definition:
          'Percentage represents a number as a fraction of 100 and is widely used in aptitude problems.',
      formula:
          'Percentage = (Part / Whole) × 100',
      example:
          'If a student scores 45 out of 60, percentage = (45/60) × 100 = 75%.',
      explanation:
          'Convert the given part into a fraction of the total and multiply by 100.',
      questions: [
        Question(
          question: 'What is 20% of 150?',
          options: ['20', '25', '30', '35'],
          answerIndex: 2,
          explanation: '20% of 150 = 20/100 × 150 = 30.',
        ),
        Question(
          question: '50 is what percentage of 200?',
          options: ['20%', '25%', '30%', '40%'],
          answerIndex: 1,
          explanation: '(50/200) × 100 = 25%.',
        ),
        Question(
          question: 'What is 75% of 80?',
          options: ['50', '55', '60', '65'],
          answerIndex: 2,
          explanation: '75/100 × 80 = 60.',
        ),
        Question(
          question: 'If a number is increased from 100 to 120, the increase is:',
          options: ['10%', '15%', '20%', '25%'],
          answerIndex: 2,
          explanation: 'Increase = 20, so percentage increase = 20%.',
        ),
        Question(
          question: '25% expressed as a fraction is:',
          options: ['1/2', '1/3', '1/4', '1/5'],
          answerIndex: 2,
          explanation: '25/100 simplifies to 1/4.',
        ),
      ],
    ),

    PlacementModule(
      id: 13,
      day: 13,
      title: 'Profit & Loss',
      category: 'Quantitative Aptitude',
      icon: '💰',
      definition:
          'Profit and Loss problems compare the cost price and selling price of an item.',
      formula:
          'Profit = SP − CP; Loss = CP − SP; Profit% = (Profit/CP) × 100.',
      example:
          'If CP = ₹500 and SP = ₹600, profit = ₹100 and profit percentage = 20%.',
      explanation:
          'Always compare the selling price with the cost price to determine profit or loss.',
      questions: [
        Question(
          question: 'If CP is ₹100 and SP is ₹120, the profit is:',
          options: ['₹10', '₹15', '₹20', '₹25'],
          answerIndex: 2,
          explanation: 'Profit = 120 − 100 = ₹20.',
        ),
        Question(
          question: 'If CP is ₹500 and SP is ₹450, the loss is:',
          options: ['₹25', '₹40', '₹50', '₹60'],
          answerIndex: 2,
          explanation: 'Loss = 500 − 450 = ₹50.',
        ),
        Question(
          question: 'An item bought for ₹200 is sold for ₹240. Profit percentage is:',
          options: ['10%', '15%', '20%', '25%'],
          answerIndex: 2,
          explanation: 'Profit = ₹40; 40/200 × 100 = 20%.',
        ),
        Question(
          question: 'If CP = SP, there is:',
          options: ['Profit', 'Loss', 'No profit or loss', 'Double profit'],
          answerIndex: 2,
          explanation: 'Equal CP and SP means no profit and no loss.',
        ),
        Question(
          question: 'A loss of ₹30 occurs when CP is ₹150 and SP is:',
          options: ['₹110', '₹120', '₹130', '₹140'],
          answerIndex: 2,
          explanation: 'SP = 150 − 30 = ₹120.',
        ),
      ],
    ),

    PlacementModule(
      id: 14,
      day: 14,
      title: 'Ratio & Proportion',
      category: 'Quantitative Aptitude',
      icon: '⚖️',
      definition:
          'Ratio compares two quantities, while proportion states that two ratios are equal.',
      formula:
          'a:b = a/b. In proportion, a:b = c:d means a × d = b × c.',
      example:
          'If boys:girls = 2:3 and there are 20 boys, girls = 20 × 3/2 = 30.',
      explanation:
          'Use the ratio parts as proportional units and scale them according to the known quantity.',
      questions: [
        Question(
          question: 'Simplify the ratio 10:15.',
          options: ['1:2', '2:3', '3:4', '4:5'],
          answerIndex: 1,
          explanation: 'Divide both terms by 5 to get 2:3.',
        ),
        Question(
          question: 'If 2:5 = x:20, x is:',
          options: ['4', '6', '8', '10'],
          answerIndex: 2,
          explanation: 'x = 20 × 2/5 = 8.',
        ),
        Question(
          question: 'The ratio of 12 to 4 is:',
          options: ['2:1', '3:1', '4:1', '5:1'],
          answerIndex: 1,
          explanation: '12:4 simplifies to 3:1.',
        ),
        Question(
          question: 'If A:B = 3:2 and B = 10, A is:',
          options: ['12', '15', '18', '20'],
          answerIndex: 1,
          explanation: 'A = 10 × 3/2 = 15.',
        ),
        Question(
          question: 'Which ratio is equivalent to 4:6?',
          options: ['2:3', '3:4', '4:5', '5:6'],
          answerIndex: 0,
          explanation: '4:6 simplifies to 2:3.',
        ),
      ],
    ),

    PlacementModule(
      id: 15,
      day: 15,
      title: 'Averages',
      category: 'Quantitative Aptitude',
      icon: '📈',
      definition:
          'Average is the central value obtained by dividing the sum of observations by their count.',
      formula:
          'Average = Sum of observations / Number of observations',
      example:
          'Average of 10, 20 and 30 = (10 + 20 + 30)/3 = 20.',
      explanation:
          'First calculate the total sum, then divide it by the number of values.',
      questions: [
        Question(
          question: 'Average of 10, 20 and 30 is:',
          options: ['15', '20', '25', '30'],
          answerIndex: 1,
          explanation: '(10 + 20 + 30) / 3 = 20.',
        ),
        Question(
          question: 'Average of 5 and 15 is:',
          options: ['8', '10', '12', '15'],
          answerIndex: 1,
          explanation: '(5 + 15) / 2 = 10.',
        ),
        Question(
          question: 'The average of four numbers is 10. Their sum is:',
          options: ['20', '30', '40', '50'],
          answerIndex: 2,
          explanation: 'Sum = Average × Number of values = 10 × 4 = 40.',
        ),
        Question(
          question: 'Average of 8, 12 and 16 is:',
          options: ['10', '12', '14', '16'],
          answerIndex: 1,
          explanation: '(8 + 12 + 16) / 3 = 12.',
        ),
        Question(
          question: 'If the average of 5 numbers is 20, their total is:',
          options: ['80', '90', '100', '120'],
          answerIndex: 2,
          explanation: 'Total = 20 × 5 = 100.',
        ),
      ],
    ),

    PlacementModule(
      id: 16,
      day: 16,
      title: 'Time & Work',
      category: 'Quantitative Aptitude',
      icon: '⏱️',
      definition:
          'Time and Work problems calculate how quickly people or machines complete a task.',
      formula:
          'Work rate = 1 / Time taken. Combined rate = Sum of individual rates.',
      example:
          'If A completes a job in 10 days, A completes 1/10 of the work per day.',
      explanation:
          'Convert completion times into daily work rates and combine the rates when people work together.',
      questions: [
        Question(
          question: 'If A completes work in 10 days, one day work is:',
          options: ['1/5', '1/10', '1/15', '1/20'],
          answerIndex: 1,
          explanation: 'One day work = 1/10.',
        ),
        Question(
          question: 'If a worker completes a job in 5 days, the work rate is:',
          options: ['1/2', '1/3', '1/4', '1/5'],
          answerIndex: 3,
          explanation: 'Daily work = 1/5.',
        ),
        Question(
          question: 'A can do a job in 6 days and B in 6 days. Together they need:',
          options: ['2 days', '3 days', '6 days', '12 days'],
          answerIndex: 1,
          explanation: 'Combined rate = 1/6 + 1/6 = 1/3, so 3 days.',
        ),
        Question(
          question: 'If a job takes 20 days, daily work is:',
          options: ['1/10', '1/15', '1/20', '1/25'],
          answerIndex: 2,
          explanation: 'Daily work = 1/20.',
        ),
        Question(
          question: 'Two workers with equal efficiency generally finish a task:',
          options: [
            'Slower than one worker',
            'In the same time',
            'Faster than one worker',
            'Never finish'
          ],
          answerIndex: 2,
          explanation: 'Their combined work rate is greater than one worker alone.',
        ),
      ],
    ),

    PlacementModule(
      id: 17,
      day: 17,
      title: 'Time, Speed & Distance',
      category: 'Quantitative Aptitude',
      icon: '🚗',
      definition:
          'These problems relate distance, speed and time for moving objects.',
      formula:
          'Speed = Distance / Time; Distance = Speed × Time; Time = Distance / Speed.',
      example:
          'A car travels 120 km in 3 hours. Speed = 120/3 = 40 km/h.',
      explanation:
          'Choose the correct formula based on the quantity that needs to be calculated.',
      questions: [
        Question(
          question: 'A car travels 100 km in 2 hours. Its speed is:',
          options: ['25 km/h', '40 km/h', '50 km/h', '60 km/h'],
          answerIndex: 2,
          explanation: 'Speed = 100/2 = 50 km/h.',
        ),
        Question(
          question: 'Distance covered at 60 km/h for 2 hours is:',
          options: ['100 km', '120 km', '140 km', '160 km'],
          answerIndex: 1,
          explanation: 'Distance = 60 × 2 = 120 km.',
        ),
        Question(
          question: 'Time required to cover 90 km at 30 km/h is:',
          options: ['2 hours', '3 hours', '4 hours', '5 hours'],
          answerIndex: 1,
          explanation: 'Time = 90/30 = 3 hours.',
        ),
        Question(
          question: 'If distance is fixed, increasing speed will:',
          options: [
            'Increase time',
            'Decrease time',
            'Keep time same',
            'Stop movement'
          ],
          answerIndex: 1,
          explanation: 'For fixed distance, time decreases when speed increases.',
        ),
        Question(
          question: 'The SI unit of speed is:',
          options: ['km', 'hour', 'm/s', 'meter'],
          answerIndex: 2,
          explanation: 'The SI unit of speed is metres per second (m/s).',
        ),
      ],
    ),

    PlacementModule(
      id: 18,
      day: 18,
      title: 'Simple & Compound Interest',
      category: 'Quantitative Aptitude',
      icon: '🏦',
      definition:
          'Interest represents the additional amount earned or paid on a principal amount.',
      formula:
          'SI = (P × R × T)/100. Amount = Principal + Interest.',
      example:
          'For P = ₹1000, R = 10%, T = 2 years, SI = ₹200.',
      explanation:
          'Simple interest is calculated directly on the principal amount. Compound interest also considers accumulated interest.',
      questions: [
        Question(
          question: 'Simple Interest on ₹1000 at 10% for 1 year is:',
          options: ['₹50', '₹100', '₹150', '₹200'],
          answerIndex: 1,
          explanation: 'SI = 1000 × 10 × 1 / 100 = ₹100.',
        ),
        Question(
          question: 'If principal is ₹500 and interest is ₹50, amount is:',
          options: ['₹450', '₹500', '₹550', '₹600'],
          answerIndex: 2,
          explanation: 'Amount = Principal + Interest = ₹550.',
        ),
        Question(
          question: 'SI depends directly on:',
          options: [
            'Principal only',
            'Rate only',
            'Time only',
            'Principal, rate and time'
          ],
          answerIndex: 3,
          explanation: 'SI = P × R × T / 100.',
        ),
        Question(
          question: 'At 5% per year, SI on ₹2000 for 2 years is:',
          options: ['₹100', '₹150', '₹200', '₹250'],
          answerIndex: 2,
          explanation: 'SI = 2000 × 5 × 2 / 100 = ₹200.',
        ),
        Question(
          question: 'Compound interest differs from simple interest because it:',
          options: [
            'Ignores principal',
            'Includes interest on accumulated interest',
            'Uses no rate',
            'Uses no time'
          ],
          answerIndex: 1,
          explanation:
              'Compound interest is calculated on the principal plus accumulated interest.',
        ),
      ],
    ),

    PlacementModule(
      id: 19,
      day: 19,
      title: 'Probability',
      category: 'Quantitative Aptitude',
      icon: '🎲',
      definition:
          'Probability measures the likelihood of an event occurring.',
      formula:
          'Probability = Favorable outcomes / Total equally likely outcomes.',
      example:
          'For a fair coin, probability of getting heads = 1/2.',
      explanation:
          'Count the favorable outcomes and divide by the total possible outcomes.',
      questions: [
        Question(
          question: 'Probability of getting heads on a fair coin is:',
          options: ['0', '1/4', '1/2', '1'],
          answerIndex: 2,
          explanation: 'There are 2 equally likely outcomes and 1 favorable outcome.',
        ),
        Question(
          question: 'Probability of an impossible event is:',
          options: ['0', '1/4', '1/2', '1'],
          answerIndex: 0,
          explanation: 'An impossible event has probability 0.',
        ),
        Question(
          question: 'Probability of a certain event is:',
          options: ['0', '1/4', '1/2', '1'],
          answerIndex: 3,
          explanation: 'A certain event always occurs, so its probability is 1.',
        ),
        Question(
          question: 'A die has how many possible outcomes?',
          options: ['4', '5', '6', '8'],
          answerIndex: 2,
          explanation: 'A standard die has six faces numbered 1 to 6.',
        ),
        Question(
          question: 'Probability of rolling a 3 on a fair die is:',
          options: ['1/2', '1/3', '1/6', '1'],
          answerIndex: 2,
          explanation: 'There is one favorable outcome among six possible outcomes.',
        ),
      ],
    ),

    PlacementModule(
      id: 20,
      day: 20,
      title: 'Permutation & Combination',
      category: 'Quantitative Aptitude',
      icon: '🧩',
      definition:
          'Permutation deals with arrangements where order matters, while combination deals with selections where order does not matter.',
      formula:
          'nPr = n!/(n-r)! and nCr = n!/[r!(n-r)!].',
      example:
          'Choosing 2 students from 5 uses combination: 5C2 = 10.',
      explanation:
          'Use permutation when arrangement order matters and combination when only selection matters.',
      questions: [
        Question(
          question: 'Which concept is used when order matters?',
          options: ['Average', 'Permutation', 'Combination', 'Probability'],
          answerIndex: 1,
          explanation: 'Permutation considers the order of arrangement.',
        ),
        Question(
          question: 'What is 3! ?',
          options: ['3', '6', '9', '12'],
          answerIndex: 1,
          explanation: '3! = 3 × 2 × 1 = 6.',
        ),
        Question(
          question: '5C1 is:',
          options: ['1', '3', '5', '10'],
          answerIndex: 2,
          explanation: 'Choosing one item from five gives 5 combinations.',
        ),
        Question(
          question: 'In combination, does order matter?',
          options: ['Yes', 'No', 'Always', 'Sometimes only'],
          answerIndex: 1,
          explanation: 'Combination is selection where order does not matter.',
        ),
        Question(
          question: '4P2 is:',
          options: ['6', '8', '12', '16'],
          answerIndex: 2,
          explanation: '4P2 = 4 × 3 = 12.',
        ),
      ],
    ),
  ];
}