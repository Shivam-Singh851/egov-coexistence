/* eGov suite of products aim to improve the internal efficiency,transparency,
   accountability and the service delivery of the government  organizations.

    Copyright (C) <2015>  eGovernments Foundation

    The updated version of eGov suite of products as by eGovernments Foundation
    is available at http://www.egovernments.org

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program. If not, see http://www.gnu.org/licenses/ or
    http://www.gnu.org/licenses/gpl.html .

    In addition to the terms of the GPL license to be adhered to in using this
    program, the following additional terms are to be complied with:

        1) All versions of this program, verbatim or modified must carry this
           Legal Notice.

        2) Any misrepresentation of the origin of the material is prohibited. It
           is required that all modified versions of this material be marked in
           reasonable ways as different from the original version.

        3) This license does not grant any rights to any user of the program
           with regards to rights under trademark law for use of the trade names
           or trademarks of eGovernments Foundation.

  In case of any queries, you can reach eGovernments Foundation at contact@egovernments.org.
 */
package org.egov.adtax.web.controller.tpbo;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

import org.egov.adtax.entity.RevenueInspector;
import org.egov.adtax.service.RevenueInspectorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/tpbo")
public class UpdateTpboController {
    @Autowired
    private RevenueInspectorService revenueInspectorService;

    @RequestMapping(value = "/updateTpbo/{name}", method = GET)
    public String update(@PathVariable final String name) {
        return "redirect:/tpbo/update/" + name;
    }

    @RequestMapping(value = "/update/{name}", method = GET)
    public ModelAndView updateView(@PathVariable("name") final String name,
            @ModelAttribute final RevenueInspector revenueInspectorRecord) {
        return new ModelAndView("tpbo-update", "revenueInspectorRecord",
                revenueInspectorService.findById(Long.parseLong(revenueInspectorRecord.getName())));

    }

    @RequestMapping(value = "update", method = GET)
    public String update(@ModelAttribute final RevenueInspector revenueInspectorRecord, final BindingResult errors,
            final RedirectAttributes redirectAttrs, @RequestParam String id) {

        if (errors.hasErrors()) {
            redirectAttrs.addFlashAttribute("name", "msg.tpbo.name");
            return "tpbo-update";
        }
        RevenueInspector existingTpboObject = new RevenueInspector();
        existingTpboObject = revenueInspectorService.findById(Long.valueOf(id));
        existingTpboObject.setActive(revenueInspectorRecord.isActive());
        revenueInspectorService.update(existingTpboObject);

        redirectAttrs.addFlashAttribute("existingTpboObject", existingTpboObject);
        redirectAttrs.addFlashAttribute("message", "msg.tpbo.update");

        return "redirect:/tpbo/success/" + id;
    }

    @RequestMapping(value = "/tpbo-update/{name}", method = GET)
    public String Search(@PathVariable final String name, @ModelAttribute final RevenueInspector revenueInspectorRecord) {
        return "redirect:/tpbo/success/" + name;
    }

    @RequestMapping(value = "/success/{id}", method = GET)
    public ModelAndView successView(@PathVariable("id") final String id,
            @ModelAttribute final RevenueInspector revenueInspectorRecord) {
        return new ModelAndView("tpbo/tpbo-searchSuccess", "revenueInspectorRecord",
                revenueInspectorService.findById(Long.valueOf(id)));

    }

}
