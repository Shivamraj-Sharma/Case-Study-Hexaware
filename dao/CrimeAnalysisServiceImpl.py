from util.DBconnection import DBConnection
from .ICrimeAnalysisService import ICrimeAnalysisService
from exception.myExceptions import IncidentNumberNotFoundException, CaseNumberNotFoundException
from tabulate import tabulate

class CrimeAnalysisServiceImpl(DBConnection,ICrimeAnalysisService):
    def createIncident(self, Incidents):
        try:
            self.cursor.execute(
                "INSERT INTO Incidents (IncidentID, IncidentType, IncidentDate, Location_Longitude, Location_Latitude, Description, Status, VictimID, SuspectID) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)",
                (Incidents.IncidentID, Incidents.IncidentType, Incidents.IncidentDate, Incidents.Location_Longitude, Incidents.Location_Latitude, Incidents.Description, Incidents.Status, Incidents.VictimID, Incidents.SuspectID),
            )
            self.conn.commit()
            print("\n\t\t...Incident Created Sucessfully...")
        except Exception as e:
            print(e)
    
    def updateIncidentStatus(self, Status, IncidentID):
        try:
            self.cursor.execute("SELECT * FROM Incidents WHERE IncidentID = ?",(IncidentID),)
            Incident = self.cursor.fetchall()
            if len(Incident) > 0:
                self.cursor.execute(
                    """
                    Update Incidents
                    Set Status = ?
                    where IncidentID = ?
                    """,
                    (Status, IncidentID),
                )
                self.conn.commit()
                print("\n\t\t...Incident Status Updated Successfully...")
            else:
                raise IncidentNumberNotFoundException(IncidentID)
        except Exception as e:
            print(e)

    def getIncidentsInDateRange(self, startDate, endDate):
        try:
            self.cursor.execute(
                """
                SELECT * FROM Incidents 
                WHERE IncidentDate >= ? AND IncidentDate <= ?
                """,
                (startDate, endDate),
            )
            Incidents = self.cursor.fetchall()  
            header = [column[0] for column in self.cursor.description]
            if len(Incidents) == 0:
                print("No Incidents in the given date range")
            else:
                print(tabulate(Incidents, headers = header, tablefmt = 'psql'))
        except Exception as e:
            print(e)
        
    def searchIncidents(self, IncidentType):
        try:
            self.cursor.execute(
                """
                SELECT * FROM Incidents
                WHERE IncidentType = ?
                """,
                (IncidentType),
            )
            Incidents = self.cursor.fetchall()  
            header = [column[0] for column in self.cursor.description]
            print(tabulate(Incidents, headers = header, tablefmt = 'psql'))
        except Exception as e:
            print(e)   

    def generateIncidentReport(self, Reports):
        try:
            self.cursor.execute(
                "INSERT INTO Reports (ReportID, IncidentID, ReportingOfficerID, ReportDate, ReportDetails, Status) VALUES (?, ?, ?, ?, ?, ?)",
                (Reports.ReportID, Reports.IncidentID, Reports.ReportingOfficerID, Reports.ReportDate, Reports.ReportDetails, Reports.Status),
            )
            self.conn.commit()
            print("\n\t\t...Incident Report Created successfully...")
        except Exception as e:
            print(e)

    def createCase(self, Cases):
        try:
            self.cursor.execute("SELECT * FROM Incidents WHERE IncidentID = ?",(Cases.IncidentID),)
            Incident = self.cursor.fetchall()
            if len(Incident) > 0:
                self.cursor.execute(
                    """
                    INSERT INTO Cases (CaseID, IncidentID, Details)
                    VALUES (?, ?, ?)
                    """,
                    (Cases.CaseID, Cases.IncidentID, Cases.Details),
                )
                self.conn.commit()
                print("\n\t\t...Case Created Successfully...")
            else:
                raise IncidentNumberNotFoundException
        except Exception as e:
            print(e)

    def getCaseDetails(self, CaseID):
        try:
            self.cursor.execute("SELECT Details FROM Cases WHERE CaseID = ?", (CaseID),)
            Cases = self.cursor.fetchall()  
            header = [column[0] for column in self.cursor.description]
            print(tabulate(Cases, headers = header, tablefmt = 'psql'))
        except Exception as e:
            print(e) 

    def updateCaseDetails(self, CaseID, Details):
        try:
            self.cursor.execute("SELECT * FROM cases WHERE CaseID = ?",(CaseID),)
            Case = self.cursor.fetchall()
            if len(Case) > 0:
                self.cursor.execute(
                    """
                    Update Cases
                    Set Details = ?
                    where CaseID = ?
                    """,
                    (Details, CaseID),
                )
                self.conn.commit()
                print("\n\t\t...Case Details Updated successfully...")
            else:
                raise CaseNumberNotFoundException(CaseID)
        except Exception as e:
            print(e)

    def getAllCases(self):
        try:
            self.cursor.execute("SELECT * FROM Cases")
            Cases = self.cursor.fetchall()  
            header = [column[0] for column in self.cursor.description]
            print(tabulate(Cases, headers = header, tablefmt = 'psql'))
        except Exception as e:
            print(e) 
