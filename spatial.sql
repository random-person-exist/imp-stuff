-- This database consists of a location which consists of the following four areas. They are abc, pqr, mno and xyz. We consider these four as different geographical locations

1) Create tables 
CREATE TABLE market(mkt_no number(5) PRIMARY KEY, mkt_name VARCHAR2(10),mkt_shape MDSYS.SDO_GEOMETRY);


2) Inserting values into the table

A) Creating abc area
INSERT INTO market VALUES(1,'abc', MDSYS.SDO_GEOMETRY(
    2003,
    NULL,
    NULL,
    MDSYS.SDO_ELEM_INFO_ARRAY(1,1003,3),
    MDSYS.SDO_ORDINATE_ARRAY(1,1,5,7)
))


B) Creating pqr area
INSERT INTO market VALUES(2,'pqr', MDSYS.SDO_GEOMETRY(
    2003,
    NULL,
    NULL,
    MDSYS.SDO_ELEM_INFO_ARRAY(1,1003,1),
    MDSYS.SDO_ORDINATE_ARRAY(5,1, 8,1, 8,6, 5,7, 5,1)
));


C) Creating mno area
INSERT INTO market VALUES(3,'mno', MDSYS.SDO_GEOMETRY(
    2003,
    NULL,
    NULL,
    MDSYS.SDO_ELEM_INFO_ARRAY(1,1003,1),
    MDSYS.SDO_ORDINATE_ARRAY(3,3, 6,3, 6,5, 4,5, 3,3)   
));

D) Creating xyz
INSERT INTO market VALUES(
4,
’xyz’,
MDSYS.SDO_GEOMETRY(
2003, -- 2-dimensional polygon
NULL,NULL,MDSYS.SDO_ELEM_INFO_ARRAY(1,1003,4), -- one circle
MDSYS.SDO_ORDINATE_ARRAY(8,7, 10,9, 8,11)
)
);



3) Adding market in the USER_SDO_GEOM_METADATA. Doing this will allow us to query our spatial data.
INSERT INTO USER_SDO_GEOM_METADATA VALUES(
    'market',
    'mkt_shape',
    MDSYS.SDO_DIM_ARRAY(
        MDSYS.SDO_DIM_ELEMENT('X',0,20,0.005),
        MDSYS.SDO_DIM_ELEMENT('Y',0,20,0.005)
    ),
    NULL
);

4) Create spatial index on market
CREATE INDEX market_spatial_index ON market(mkt_shape) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

5) Running queries
a)Return the topological intersection of two geometries.
SELECT SDO_GEOM.SDO_INTERSECTION(a.mkt_shape,b.mkt_shape,0.005) FROM market a, market b WHERE a.mkt_name = 'abc' AND b.mkt_name = 'mno';

b) Do two geometries have any spatial relationship?
SELECT SDO_GEOM.RELATE(a.mkt_shape,'anyinteract',b.mkt_shape,0.005) FROM market a, market b WHERE a.mkt_name = 'abc' AND b.mkt_name = 'pqr';
SELECT SDO_GEOM.RELATE(a.mkt_shape,'anyinteract',b.mkt_shape,0.005) FROM market a, market b WHERE a.mkt_name = 'abc' AND b.mkt_name = 'xyz';


c) Return the areas of all cola markets.
SELECT SDO_GEOM.SDO_AREA(mkt_shape,0.005) FROM market; 

d) Return the area of just cola_a.
SELECT SDO_GEOM.SDO_AREA(a.mkt_shape,0.005) from market a WHERE a.mkt_name = 'pqr';

-- Return the distance between two geometries.
SELECT SDO_GEOM.SDO_DISTANCE(c_b.shape, c_d.shape, 0.005)
   FROM cola_markets c_b, cola_markets c_d
   WHERE c_b.name = 'cola_b' AND c_d.name = 'cola_d';

-- Is a geometry valid?
SELECT c.name, SDO_GEOM.VALIDATE_GEOMETRY_WITH_CONTEXT(c.shape, 0.005)
   FROM cola_markets c WHERE c.name = 'cola_c';

-- Is a layer valid? (First, create the results table.)
CREATE TABLE val_results (sdo_rowid ROWID, result VARCHAR2(2000));
EXECUTE SDO_GEOM.VALIDATE_LAYER_WITH_CONTEXT('COLA_MARKETS', 'SHAPE', 
  'VAL_RESULTS', 2);
SELECT * from val_results;