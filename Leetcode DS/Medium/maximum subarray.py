## DP ##
class Solution(object):
    def maxSubArray(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        dp = [0] * len(nums)
        
        for i,n in enumerate(nums):

            dp[i] =  max(n, dp[i-1]+n)
        return max(dp)

## sliding window ##
class Solution(object):
    def maxSubArray(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """

        lsum=nums[0]
        currsum=0
        
        for n in nums:
            if currsum < 0:
                currsum = 0
            currsum+=n
            lsum = max(currsum, lsum)
        
        return lsum
