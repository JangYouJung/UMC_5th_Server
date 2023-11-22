// temp.service.js

import { tempResponseDTO } from "../dtos/temp.response.dto.js";

export const getTempData = () => {
    return tempResponseDTO("This is TEST! >.0");
}

/*
//에러 핸들링 실습
export function CheckFlag(flag){
    if(flag == 1)
        throw new Error("Flag is 1!!");   // 에러 발생시키기!
    else{
        return flagResponseDTO(flag);
    }
}
*/

import { BaseError } from "../../config/error.js";
import { status } from "../../config/response.status.js";

export function CheckFlag(flag){
    if(flag == 1)
        throw new BaseError(status.BAD_REQUEST);   // 에러 발생시키기!
    else{
        return flagResponseDTO(flag);
    }
}