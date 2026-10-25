This post is ment for following best practices for TestNG Tests Arrangements 

### Test Case Naming 

### Test Data Management 

### Listeners 
- HTML reporting 
- XML reporting 
- Storing results in dashboard 

#### Dashboard Results 
- Grafana TimescaleDB solution
- TestNG listener 

code Example for single tests arranged test by test => 

```java
import org.testng.ITestContext;
import org.testng.ITestListener;
import org.testng.ITestResult;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class MySqlListener implements ITestListener {
    private Connection connection;
    String jdbcurl = "jdbc:mysql://localhost:3306/test_reports";
    @Override
    public void onStart(ITestContext context) {
        try {
            connection = DriverManager.getConnection(jdbcurl, "username", "password");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void onTestSuccess(ITestResult result) {
        saveTestResult(result, "PASSED");
    }

    @Override
    public void onTestFailure(ITestResult result) {
        saveTestResult(result, "FAILED");
    }
//sample DB table used here 
    private void saveTestResult(ITestResult result, String status) {
        String sql = "INSERT INTO testng_logs (test_name, status, duration) VALUES (?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, result.getMethod().getMethodName());
            stmt.setString(2, status);
            stmt.setLong(3, result.getEndMillis() - result.getStartMillis());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void onFinish(ITestContext context) {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
```

### Example with TimeScaleDB listener 

### Example with Oracle DB Listener 

### Example with InfluxDb Listener

### Neo4j 

### Suite File Organizations

### Reporting 
- Output location 
- publishing 

### Custom Annotation 
- Adding test meta data
- custom logging 
- 

### 