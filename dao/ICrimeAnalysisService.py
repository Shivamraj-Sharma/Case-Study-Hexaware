from abc import ABC, abstractmethod

class ICrimeAnalysisService(ABC):
    @abstractmethod
    def createIncident(self, Incidents):
        pass

    @abstractmethod
    def updateIncidentStatus(self, Status, IncidentID):
        pass

    @abstractmethod
    def getIncidentsInDateRange(self, startDate, endDate):
        pass

    @abstractmethod
    def searchIncidents(self, IncidentType):
        pass

    @abstractmethod
    def updateCaseDetails(self):
        pass

    @abstractmethod
    def getCaseDetails(self, caseID):
        pass

    @abstractmethod
    def generateIncidentReport(self, Incidents):
        pass

    @abstractmethod
    def createCase(self, Cases):
        pass

    @abstractmethod
    def getAllCases(self):
        pass