class Solution(object):
    def minSubArrayLen(self, target, nums):
        """
        :type target: int
        :type nums: List[int]
        :rtype: int
        """
        mincount = float('inf')
        currsum = 0 
        l = 0

        for r in range(len(nums)):
            currsum+= nums[r]

            while currsum>=target:
                mincount = min (mincount, r-l+1)
                currsum -= nums[l]
                l+=1
        
        return 0 if mincount == float('inf') else mincount
