import axios from "axios";
import { fetchAll } from "./aCases";

const baseUrl = "https://localhost:7252/api/"

export default{
    cases(url = baseUrl + 'CaseEntities/'){
        return {
            fetchAll : () => axios.get(url),
            fetchById : id => axios.get(url + id),
            create : newRecord => axios.post(url, newRecord),
            update: (id, updateRecord) => axios.put(url+id,updateRecord),
            delete: id => axios.delete(url + id),
        }
    }
}
