USE ASM1
--Có bao nhiêu vật nuôi được tiêm phòng cũng được triệt sản?
SELECT SUM(p.Quantity)
FROM Pet_Fact p JOIN Health_DIM h on p.HealthID = h.HealthID
WHERE h.Vaccinated = 'Yes' AND h.Sterilized = 'Yes'
--Có bao nhiêu vật nuôi ở một bang?
SELECT SUM(p.Quantity)
FROM Pet_Fact p JOIN State_DIM s on p.StateID = s.StateID
GROUP BY s.State
--Phí nhận nuôi trung bình theo kích thước trưởng thành
SELECT AVG(Fee), m.MaturitySize
FROM Pet_Fact p JOIN MaturitySize_DIM m on p.MaturitySizeID = m.MaturitySizeID
GROUP BY m.MaturitySize
--Có bao nhiêu vật nuôi cùng màu ?
SELECT SUM(p.Quantity)
FROM Pet_Fact p JOIN Color_DIM c on (p.Color1ID = c.ColorID OR p.Color2ID = c.ColorID OR p.Color3ID = c.ColorID)
GROUP BY c.Color