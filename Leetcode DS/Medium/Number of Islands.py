class Solution(object):
    def numIslands(self, grid):
        """
        :type grid: List[List[str]]
        :rtype: int
        """

        res = 0

        visited = set()

        def bfs(x,y):

            queue = deque()
            queue.append((x,y))
            visited.add((x,y))

            while queue:

                cx,cy = queue.popleft()

                for dx, dy in directions:
                    nx,ny = cx+dx, cy+dy

                    if ( 0<= nx < len(grid) and  0<= ny < len(grid[0]) and (nx,ny) not in visited and grid[nx][ny] == '1'):

                        queue.append((nx,ny))
                        visited.add((nx,ny))

        directions = {(1,0),(0,1),(-1,0),(0,-1)}
        for x in range(len(grid)):
            for y in range(len(grid[0])):

                if grid[x][y] == '1' and (x,y) not in visited:
                    res+=1
                    bfs(x,y)
        return res








        
