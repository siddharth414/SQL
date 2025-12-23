class Solution(object):
    def threeSum(self, nums):
        """
        :type nums: List[int]
        :rtype: List[List[int]]
        """
        nums.sort()
        result=[]

        for i , v in enumerate(nums):

            if v > 0:
                return result
            elif i > 0 and nums[i] == nums[i-1]:
                continue

            l,r = i+1, len(nums)-1

            while l < r:

                sum = nums[i] + nums[l] + nums[r]

                if sum < 0:
                    l+=1
                elif sum > 0:
                    r-=1
                else:
                    result.append([nums[i] , nums[l] , nums[r]])
                    l+=1
                    r-=1
                    while l<r and nums[l] == nums[l-1]:
                        l+=1
        return result
            
