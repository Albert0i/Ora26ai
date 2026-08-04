const oracledb = require('oracledb');

async function run() {
  let connection;
  try {
    connection = await oracledb.getConnection({
      user: "testuser",          // replace with your username
      password: "testpwd",       // replace with your password
      connectString: "localhost:1521/FREEPDB1" // host:port/service
    });

    const result = await connection.execute("SELECT 'Hello World!' FROM dual");
    console.log(result.rows[0]);
  } catch (err) {
    console.error("Error:", err);
  } finally {
    if (connection) {
      try {
        await connection.close();
      } catch (err) {
        console.error("Close error:", err);
      }
    }
  }
}

run();

/*
   # 1. Install the Oracle DB driver
        npm install oracledb

  # 2. libaio = Linux Asynchronous I/O library on which      
       sudo apt-get install libaio1

  # 3. Oracle Instant Client Downloads
       https://www.oracle.com/database/technologies/instant-client/downloads.html  

  # 4. Download and unzip Oracle Instant Client (Basic + SDK) from Oracle site
       export LD_LIBRARY_PATH=/opt/oracle/instantclient_23_26:$LD_LIBRARY_PATH
       export PATH=/opt/oracle/instantclient_23_26:$PATH

  # 5. Run it
   node test.js
*/