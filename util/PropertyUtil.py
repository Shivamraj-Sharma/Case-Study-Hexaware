class PropertyUtil:
    @staticmethod
    def get_property_string():
        server_name = "LAPTOP-B50VHI1T\\SQLEXPRESS"
        database_name = "Case_Study"

        conn_str = (
            f"Driver={{SQL Server}};"
            f"Server={server_name};"
            f"Database={database_name};"
            f"Trusted_Connection=yes;"
        )

        return conn_str