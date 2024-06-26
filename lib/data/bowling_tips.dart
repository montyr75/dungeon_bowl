const bowlingTips = [
  "There are 39 boards on a lane, each about 1 inch wide.",
  "Your sliding shoe (the one you end your approach on) should be the opposite of the hand you bowl with.",
  "Crossing the foul line during your approach results in an automatic zero score for that throw.",
  "Aim for the arrows on the lane, not the pins! The arrows are 15 feet away and much easier to target than the pins, which are 60 feet away.",
  "The breakpoint is the point on the lane where your ball begins to hook toward the pocket (hopefully).",
  "The 7-10 split, sometimes called bedposts or goalposts, occurs when only the 7 and 10 pins remain after a shot. Fun fact: This is not actually the hardest split to pick up.",
  "The last person to bowl on a team in league play is known as the anchor. Optimally the best bowler on the team and someone who is cool under pressure.",
  "A Brooklyn hit occurs when your ball crosses over the head pin to hit the opposite pocket from your bowling hand (the Jersey side of the head pin).",
  "Three strikes in a row is known as a turkey.",
  "Four strikes in a row is sometimes referred to as a hambone.",
  "On a spare pickup, a pin located directly behind the 1, 2, or 3 pin is known as a sleeper.",
  "A full set of pins has two pockets, the first between the 1 and 2 pins, and the second between the 1 and 3 pins. These are the optimal points of impact to achieve a strike.",
  "Non-league bowling for practice or fun is known in the bowling center as open bowling.",
  "Throwing the ball far out onto the lane on release is called lofting. It's generally considered poor technique, but it is a tool that has its uses in some situations.",
  "Throwing a hook that goes in the same direction as your bowling hand is called a backup ball.",
  "If you make all your spares in a game, that's known as having a clean sheet.",
  "Getting two strikes in a row is called a double.",
  "The number of pins knocked down immediately following either a spare or two strikes is called the fill.",
  "When a pin remains in the gutter after being knocked down, it's known as deadwood.",
  "There are two baby splits: the 2-7 split and the 3-10 split.",
  "A frame is 1/10th of a bowling game.",
  "A strike in the 9th frame is known as a foundation.",
  "The leave refers to the pins left after the first throw of a frame.",
  "The 5-7-10 split is called a lily, or sometimes a sour apple.",
  "There are several ways to refer to a missed spare: miss, error, or open frame.",
  "A strike in which the pins appear to fall one-by-one rather than all together is called a schleifer, a German term meaning \"slice.\"",
  "A split is defined as a leave of two or more pins with a gap between them.",
  "If you're just piling up strikes by throwing a very fast ball, someone might tell you you're throwing rocks.",
  "Pins that seem light or easy to knock down in a game are sometimes called kindling wood.",
  "A lane condition that promotes high scoring through the use of oil or finish in lane maintenance is called a blocked lane.",
  "Achieving 12 consecutive strikes in a game results in a perfect game, a score of 300.",
  "A nose hit is what it's called when you hit the pins head on.",
  "When trying to pick up a spare, if you knock down only the front pin or pins, that's known as a cherry.",
  "There are two versions of the Greek Church split: 4-6-7-9-10 and 4-6-7-8-10. Visually, these configurations are reminiscent of an old cathedral church with spires. This is the world's hardest split to spare.",
  "The 4-6-7-10 split is sometimes called the Big Four.",
  "Your bowling arm should swing back like a pendulum, remaining straight and not wrapping around your backside. Your body should move to the side to avoid being hit by the swing.",
  "Drinking a bit of alcohol while bowling can ease your tension and improve your confidence, but too much will cause you to lose your form.",
  "Remember to keep your arm straight when swinging the ball. Bending your elbow will decrease both accuracy and power.",
  "After release, be sure to watch your ball's path and observe where it strikes the pins. This will help you make any necessary adjustments on your next throw.",
  "Bowling etiquette dictates that if someone is approaching their lane to your immediate left or right, to avoid distracting them, you should wait until they're finished to begin your turn.",
  "Remember, if you're not having fun bowling, you're probably sober.",
  "Bowling is all physics and energy distribution. It's just F = ma.",
  "\"I like bowling. I suck at it, but I like it. You know what's so funny? I have days when I'm absolutely great at doing it, and then I have days when I just don't understand it.\" --Lil' Kim",
  "Bowling is the most popular competitive sport in the United States, and the fifth most popular recreational sport.",
  "More than 67 million people in the United States bowl during a year.",
  "More than 1.2 million people compete regularly in league play certified by the United States Bowling Congress.",
  "Bowling is fun in your spare time.",
  "Bowling is right up my alley.",
  "\"This is not ‘Nam. This is bowling. There are rules.\" --John Goodman, The Big Lebowski",
  "\"The bowling alley is the poor man’s country club.\" --Sanford Hansell",
  "\"Bowling would be more interesting if it were slightly uphill.\" --Demetri Martin",
  "\"Bowling is not a sport because you have to rent the shoes.\" --George Carlin",
  "\"Having children is like having a bowling alley installed in your brain.\" --Martin Mull",
  "A Christmas tree is a 3-7-10 split for a right-handed bowler, or a 2-7-10 split for lefties.",
  "Bowling balls with a plastic coverstock are perfect for beginners, straight bowlers, and tight budgets. They don’t hook much, or even at all.",
  "Bowling balls with urethane coverstock are perfect for hook shots. They don’t absorb oil, and they provide more friction than a plastic ball, hence the powerful hook.",
  "Bowling balls with a reactive resin coverstock are perfect if you’re serious about throwing a mean hook shot, because the resin digs into the oil on the lane, providing a greater opportunity for hitting the pocket.",
  "The ideal bowling ball speed is 16 mph, but the right speed for you is whatever it takes to knock down all the pins.",
];