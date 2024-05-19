class Incidents:
    def __init__(self, IncidentID, IncidentType, IncidentDate, Location_Longitude, Location_Latitude, Description, Status, VictimID, SuspectID):
        self.IncidentID = IncidentID
        self.IncidentType = IncidentType
        self.IncidentDate = IncidentDate
        self.Location_Longitude = Location_Longitude
        self.Location_Latitude = Location_Latitude
        self.Description = Description
        self.Status = Status
        self.VictimID = VictimID
        self.SuspectID = SuspectID