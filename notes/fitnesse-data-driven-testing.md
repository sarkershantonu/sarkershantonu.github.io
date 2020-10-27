```



<dependency>
   <groupId>org.fitnesse</groupId>
   <artifactId>fitnesse</artifactId>
   <!-- version>20150424</version -->   <version>20140201</version>
</dependency>

<build>
   <plugins>

      <plugin>
         <groupId>org.apache.maven.plugins</groupId>
         <artifactId>maven-resources-plugin</artifactId>
         <version>2.6</version>
         <executions>
            <execution>
               <id>plugins</id>
               <phase>validate</phase>
               <goals>
                  <goal>copy-resources</goal>
               </goals>
               <configuration>
                  <outputDirectory>${project.build.directory}/fitnesse</outputDirectory>
                  <resources>
                     <resource>
                        <directory>src/test/fitnesse</directory>
                        <includes>
                           <include>plugins.properties</include>
                        </includes>
                     </resource>
                  </resources>
               </configuration>
            </execution>
            <execution>
               <id>frontpage</id>
               <phase>validate</phase>
               <goals>
                  <goal>copy-resources</goal>
               </goals>
               <configuration>
                  <outputDirectory>${project.build.directory}/fitnesse/FitNesseRoot/FrontPage</outputDirectory>
                  <resources>
                     <resource>
                        <directory>src/test/fitnesse/FrontPage</directory>
                     </resource>
                  </resources>
               </configuration>
            </execution>
         </executions>
      </plugin>

      <plugin>
         <groupId>uk.co.javahelp.fitnesse</groupId>
         <artifactId>fitnesse-launcher-maven-plugin</artifactId>

         <configuration>

            <useProjectDependencies>
               <scope>compile</scope>
               <scope>runtime</scope>
            </useProjectDependencies>

            <launches>
               <launch>
                  <test>BookstoreNextGen.WorkFlows.SimpleWorkflowTest</test>
               </launch>
            </launches>

         </configuration>

         <!-- dependencies> <dependency> <groupId>org.fitnesse</groupId> <artifactId>fitnesse</artifactId>             <version>20150424</version> </dependency> </dependencies -->      </plugin>

   </plugins>
</build>

<profiles>
   <profile>
      <id>wiki</id>
      <!-- This profile is for use when writing tests using the FitNesse wiki.          Simply run 'mvn verify -P wiki' and use a browser to visit http://localhost:9123/JavaExample -->      <build>
         <plugins>
            <plugin>
               <groupId>uk.co.javahelp.fitnesse</groupId>
               <artifactId>fitnesse-launcher-maven-plugin</artifactId>
               <executions>
                  <execution>
                     <goals>
                        <goal>set-up</goal>
                        <goal>wiki</goal>
                        <goal>tear-down</goal>
                     </goals>
                  </execution>
               </executions>
            </plugin>
         </plugins>
      </build>
   </profile>
   <profile>
      <id>auto</id>
      <!-- This profile will boot FitNesse to automatically run the configured          test suite. Simply run 'mvn verify -P auto' -->      <build>
         <plugins>
            <plugin>
               <groupId>uk.co.javahelp.fitnesse</groupId>
               <artifactId>fitnesse-launcher-maven-plugin</artifactId>
               <executions>
                  <execution>
                     <goals>
                        <goal>set-up</goal>
                        <goal>run-tests</goal>
                        <goal>tear-down</goal>
                        <goal>verify</goal>
                     </goals>
                  </execution>
               </executions>
            </plugin>
         </plugins>
      </build>
   </profile>
</profiles>

----- Thanks.. :)
 ```