class Solution(object):
    def isValid(self, s):
        """
        :type s: str
        :rtype: bool
        """
        stack=[]
        dict={ ')':'(', ']':'[' ,'}':'{' }
        
        for i in s:
            if i not in dict:
                stack.append(i)
                continue
            if not stack or stack[-1] != dict[i]:
                return False
            
            stack.pop()

        return not stack         
