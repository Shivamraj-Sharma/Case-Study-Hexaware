class IncidentNumberNotFoundException(Exception):
    def __init__(self, IncidentID):
        super().__init__(f"Incident with ID {IncidentID} is not Found")

class CaseNumberNotFoundException(Exception):
    def __init__(self, CaseID):
        super().__init__(f"Case with ID {CaseID} is not Found")