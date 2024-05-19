import unittest
from unittest.mock import MagicMock, patch
from datetime import datetime
from util.DBconnection import DBConnection
from dao.CrimeAnalysisServiceImpl import CrimeAnalysisServiceImpl
from exception.myExceptions import IncidentNumberNotFoundException, CaseNumberNotFoundException

class TestCrimeAnalysisServiceImpl(unittest.TestCase):
    
    def setUp(self):
        self.service = CrimeAnalysisServiceImpl()
        self.service.conn = MagicMock()
        self.service.cursor = MagicMock()

    def test_createIncident_success(self):
        incident = MagicMock()
        self.service.createIncident(incident)
        self.service.cursor.execute.assert_called_once()
        self.service.conn.commit.assert_called_once()
        print("test_createIncident_success passed")

    def test_updateIncidentStatus_success(self):
        incident_id = 1
        status = "Open"
        self.service.cursor.fetchall.return_value = [(1,)]
        
        self.service.updateIncidentStatus(status, incident_id)
        
        self.service.cursor.execute.assert_any_call("SELECT * FROM Incidents WHERE IncidentID = ?", (incident_id),)
        # self.service.cursor.execute.assert_any_call("UPDATE Incidents SET Status = ? WHERE IncidentID = ?", (status, incident_id),)
        self.service.conn.commit.assert_called_once()
        print("test_updateIncidentStatus_success passed")

if __name__ == '__main__':
    unittest.main()