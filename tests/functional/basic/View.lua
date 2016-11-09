-------------------------------------------------------------------------------------------
-- TerraME - a software platform for multiple scale spatially-explicit dynamic modeling.
-- Copyright (C) 2001-2016 INPE and TerraLAB/UFOP -- www.terrame.org

-- This code is part of the TerraME framework.
-- This framework is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public
-- License as published by the Free Software Foundation; either
-- version 2.1 of the License, or (at your option) any later version.

-- You should have received a copy of the GNU Lesser General Public
-- License along with this library.

-- The authors reassure the license terms regarding the warranties.
-- They specifically disclaim any warranties, including, but not limited to,
-- the implied warranties of merchantability and fitness for a particular purpose.
-- The framework provided hereunder is on an "as is" basis, and the authors have no
-- obligation to provide maintenance, support, updates, enhancements, or modifications.
-- In no event shall INPE and TerraLAB / UFOP be held liable to any party for direct,
-- indirect, special, incidental, or consequential damages arising out of the use
-- of this software and its documentation.
--
-------------------------------------------------------------------------------------------

return {
	View = function(unitTest)
		local view = View{
			title = "Emas National Park",
			description = "A small example related to a fire spread model.",
			border = "blue",
			width = 2,
			color = "PuBu",
			visible = true,
			select = "river",
			value = {0, 1, 2}
		}

		unitTest:assertType(view, "View")
		unitTest:assertEquals(view.title, "Emas National Park")
		unitTest:assertEquals(view.description, "A small example related to a fire spread model.")
		unitTest:assertEquals(view.width, 2)
		unitTest:assertEquals(view.visible, true)
		unitTest:assertEquals(view.select, "river")
		unitTest:assertEquals(view.border, "rgba(0, 0, 255, 1)")

		unitTest:assertEquals(view.value[1], 0)
		unitTest:assertEquals(view.value[2], 1)
		unitTest:assertEquals(view.value[3], 2)

		unitTest:assertType(view.color, "table")
		unitTest:assertEquals(getn(view.color), 3)
		unitTest:assertEquals(view.color[view.value[1]], "rgba(236, 231, 242, 1)")
		unitTest:assertEquals(view.color[view.value[2]], "rgba(166, 189, 219, 1)")
		unitTest:assertEquals(view.color[view.value[3]], "rgba(43, 140, 190, 1)")

		view = View{
			title = "Emas National Park",
			description = "A small example related to a fire spread model.",
			border = "red",
			width = 2,
			color = "blue",
			visible = true,
			select = "river"
		}

		unitTest:assertType(view, "View")
		unitTest:assertEquals(view.title, "Emas National Park")
		unitTest:assertEquals(view.description, "A small example related to a fire spread model.")
		unitTest:assertEquals(view.width, 2)
		unitTest:assertEquals(view.visible, true)
		unitTest:assertEquals(view.select, "river")
		unitTest:assertEquals(view.border, "rgba(255, 0, 0, 1)")
		unitTest:assertEquals(view.color, "rgba(0, 0, 255, 1)")

		view = View{
			color = "blue",
			layer = tostring(filePath("Limit_pol.shp", "terralib"))
		}

		unitTest:assertType(view, "View")
		unitTest:assertEquals(view.color, "rgba(0, 0, 255, 1)")
		unitTest:assertType(view.layer, "File")
		unitTest:assert(view.layer:exists())
	end,
	__tostring = function(unitTest)
		local view = View{
			title = "Emas National Park",
			border = "blue",
			width = 2,
			color = "PuBu",
			visible = true,
			select = "river",
			value = {0, 1, 2}
		}

		unitTest:assertEquals(tostring(view), [[border   string [rgba(0, 0, 255, 1)]
color    named table of size 3
select   string [river]
title    string [Emas National Park]
value    vector of size 3
visible  boolean [true]
width    number [2]
]])
	end
}