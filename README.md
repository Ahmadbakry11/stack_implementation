# Stack Implementation
 
### Why my solution is faster or better.
  - I decided to depend on linkedlist to implement the stack
  - Each time I push to the stack, I change the head and vice versa, when popping from the stack
  - So, each pop() or push() operation will have the time complexity of O(1).
  - I am using another stack to track the max of the stack at any time.
  - So, getting the maximum at any time will be of O(1).
  - Calculating the average also will be of O(1).
  - Based on the above, my solution is fast or faster but with a cost of having extra stack.
  - push() ---> O(1)
  - pop() ---> O(1)
  - avg() ---> O(1)
  - max() ---> O(1)
  - space complexity ---> O(2n)
