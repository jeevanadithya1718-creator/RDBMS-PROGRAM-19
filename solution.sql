SET SERVEROUTPUT ON;

DECLARE
    CURSOR stu_cursor IS
        SELECT StudentID, StudentName, DepartmentID
        FROM Student;

    v_StudentID   Student.StudentID%TYPE;
    v_StudentName Student.StudentName%TYPE;
    v_DepartmentID Student.DepartmentID%TYPE;

BEGIN
    OPEN stu_cursor;

    LOOP
        FETCH stu_cursor
        INTO v_StudentID, v_StudentName, v_DepartmentID;

        EXIT WHEN stu_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Student ID: ' || v_StudentID ||
            '  Name: ' || v_StudentName ||
            '  Department ID: ' || v_DepartmentID
        );
    END LOOP;

    CLOSE stu_cursor;
END;
/
