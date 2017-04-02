class JaccardPoint:

    def __init__(self, user_id, interests=None):

        self.user_id = user_id
        if interests is None:
            self.interests = []
        else:
            self.interests = interests

    def weightedJaccardDistance(self, other):

        numerator = 0
        denominator = 110

        for self_worth, self_interest in enumerate(self.getInterests()):
            for other_worth, other_interest in other.getInterests():
                if self_interest == other_interest:
                    numerator += ((self_worth + 1) + (other_worth + 1 ) )

        return (1 - (numerator/denominator))


    def getInterests(self):

        return self.interests

    def getID(self):

        return self.user_id


def makeDict(jaccardPoints):

    d = {}

    for i, point in enumerate(jaccardPoints):
        distDict = {}
        for j, point2 in enumerate(jaccardPoints):
            if(i == j):
                continue
            distDict[point2.getID()] = point.weightedJaccardDistance(point2)
        d[point.getID()] = [distDict, point.getID()]

    return d


