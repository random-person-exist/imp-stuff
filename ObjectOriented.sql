Insert 10 records into the above tables and fire the following queries:

a) List all of the authors that have the same pin code as their publisher:
b) List all books that have 2 or more authors:
c) List the name of the publisher that has the most branches
d) Name of authors who have not published a book
e) List all authors who have published more than one book:
f) Name of authors who have published books with at least two different publishers
g) List all books (title) where the same author appears more than once on the list of authors (assuming that an integrity constraint requiring that the name of an author is unique in a list of authors has not been specified).


CREATE TYPE AddrType AS OBJECT(pincode number(10), street char(20), city char(10), state char(10))
CREATE TYPE BranchType AS OBJECT(addresss AddrType, phone1 integer, phone2 integer)
CREATE TYPE AuthorType AS OBJECT(name char(10), addr AddrType)

CREATE TYPE BranchTableType AS TABLE OF BranchType 
CREATE TABLE authors OF AuthorType 

CREATE TYPE PublisherType AS OBJECT(name char(15), addr AddrType,branches BranchTableType) 
CREATE TYPE AuthorListType AS varray(2) OF REF  AuthorType;

CREATE TABLE books(title varchar2(10), year date, published_by ref PublisherType, authors AuthorListType)
CREATE TABLE Publishers of PublisherType NESTED TABLE branches STORE AS BranchType


-- AUTHORS TABLE
INSERT INTO authors VALUES('author1',AddrType(12345,'street1','city1','state1'));
INSERT INTO authors VALUES('author2',AddrType(12346,'street2','city2','state2'));
INSERT INTO authors VALUES('author3',AddrType(12347,'street3','city3','state3'));
INSERT INTO authors VALUES('author4',AddrType(12348,'street4','city4','state4'));
INSERT INTO authors VALUES('author5',AddrType(12349,'street5','city5','state5'));
INSERT INTO authors VALUES('author6',AddrType(12340,'street6','city6','state6'));
INSERT INTO authors VALUES('author7',AddrType(123411,'street7','city7','state7'));
INSERT INTO authors VALUES('author8',AddrType(123412,'street8','city8','state8'));
INSERT INTO authors VALUES('author9',AddrType(123413,'street9','city9','state9'));
INSERT INTO authors VALUES('author10',AddrType(123414,'street10','city10','state10'));


-- PUBLISHERS TABLE
INSERT INTO Publishers VALUES('pub1',
AddrType(54321,'pubstreet1','pubcity1','state1'),
BranchTableType(
    BranchType(AddrType(54321,'pubstreet','pubcity','state1'), 987654321,123456789))
);

INSERT INTO Publishers VALUES('pub2',AddrType(54322,'pubstreet2','pubcity2','state2'),
BranchTableType(BranchType(
    AddrType(54322,'pubstreet2','pubcity2','state2'),987654322,223456789)
    )
)

INSERT INTO Publishers VALUES('pub3',AddrType(54333,'pubstreet3','pubcity3','state3'),
BranchTableType(BranchType(
    AddrType(54333,'pubstreet3','pubcity3','state3'),987654333,333456789)
    )
);

INSERT INTO Publishers VALUES('pub4',AddrType(54344,'pubstreet4','pubcity4','state4'),
BranchTableType(BranchType(
    AddrType(54344,'pubstreet4','pubcity4','state4'),987654344,443456789)
    )
);

INSERT INTO Publishers VALUES('pub5',AddrType(54355,'pubstreet5','pubcity5','state5'),
BranchTableType(BranchType(
    AddrType(54355,'pubstreet5','pubcity5','state5'),987654355,553456789)
    )
);

INSERT INTO Publishers VALUES('pub6',AddrType(54366,'pubstreet6','pubcity6','state6'),
BranchTableType(BranchType(
    AddrType(54366,'pubstreet6','pubcity6','state6'),987654366,663456789)
    )
);

INSERT INTO Publishers VALUES('pub7',AddrType(54377,'pubstreet7','pubcity7','state7'),
BranchTableType(BranchType(
    AddrType(54377,'pubstreet7','pubcity7','state7'),987654377,773456789)
    )
);

INSERT INTO Publishers VALUES('pub8',AddrType(54388,'pubstreet8','pubcity8','state8'),
BranchTableType(BranchType(
    AddrType(54388,'pubstreet8','pubcity8','state8'),987654388,883456789)
    )
);

INSERT INTO Publishers VALUES('pub9',AddrType(54399,'pubstreet9','pubcity9','state9'),
BranchTableType(BranchType(
    AddrType(54399,'pubstreet9','pubcity9','state9'),987654399,993456789)
    )
);

INSERT INTO Publishers VALUES('pub0',AddrType(54300,'pubstreet0','pubcity0','state0'),
BranchTableType(BranchType(
    AddrType(54300,'pubstreet0','pubcity0','state0'),987654300,003456789)
    )
);









