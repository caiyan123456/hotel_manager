package com.whhp.k9501.controller;

import com.whhp.k9501.service.BillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

@Controller
public class BillController {
    public String getAllBill(){
        return "list";
    }
}
