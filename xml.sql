CREATE TABLE student(stud_id number PRIMARY KEY, info XMLTYPE);

INSERT INTO student VALUES(1, XMLTYPE(
    '<student>
        <stud roll = "1">
            <name>Soham</name>
            <age>21</age>
            <fees>Paid</fees>
        </stud>
    </student>'
));

INSERT INTO student VALUES(2, XMLTYPE(
    '<student>
        <stud roll = "2">
            <name>Archit</name>
            <age>19</age>
            <fees>Paid</fees>
        </stud>
    </student>'
));

INSERT INTO student VALUES(3, XMLTYPE(
    '<student>
        <stud roll = "3">
            <name>Kuntal</name>
            <age>22</age>
            <fees>Unpaid</fees>
        </stud>
    </student>'
));

INSERT INTO student VALUES(4, XMLTYPE(
    '<student>
        <stud roll = "4">
            <name>prachi</name>
            <age>21</age>
            <fees>Dounle paid</fees>
        </stud>
    </student>'
));



SELECT a.info.extract('student/stud/name/text()').getStringVal() "name" from student a;

SELECT a.info.extract('student/stud/name/text()').getStringVal() "name", 
a.info.extract('student/stud/age/text()').getStringVal "age",
a.info.extract('student/stud/fees/text()').getStringVal "fees status" from student a;