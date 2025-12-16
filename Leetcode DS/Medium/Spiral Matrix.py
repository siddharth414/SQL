class Solution(object):
    def spiralOrder(self, matrix):
        """
        :type matrix: List[List[int]]
        :rtype: List[int]
        """

        res = []

        while matrix:

            res += matrix.pop(0)

            if matrix and matrix[0]:

                for row in matrix:
                    res.append(row.pop())

            if matrix:
                res += matrix.pop()[::-1]
            
            if matrix and matrix[0]:

                for row in matrix[::-1]:
                    res.append(row.pop(0))

        return res           
        
