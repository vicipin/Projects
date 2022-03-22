import { type } from "@testing-library/user-event/dist/type"
import api from "./api";

export const ACTION_TYPES={
    CREATE : 'CREATE',
    UPDATE : 'UPDATE',
    DELETE : 'DELETE',
    FETCH_ALL : 'FETCH_ALL'
}
const formateData = data => ({
    ...data,
    cost: parseInt(data.cost ? data.cost : 0)
})
export const fetchall = () => dispatch => {
    api.cases().fetchAll()
    .then( response => {
        console.log(response)
            dispatch({
                type: ACTION_TYPES.FETCH_ALL,
                payload: response.data
            })
    
        }
    )
    .catch(err => console.log(err))
        //get api request
        
}
export const create = (data, onSuccess) => dispatch => {
    data = formateData(data)
    api.cases().create(data)
        .then(res => {
            dispatch({
                type: ACTION_TYPES.CREATE,
                payload: res.data
            })
            onSuccess()
        })
        .catch(err => console.log(err))
}

export const update = (id, data, onSuccess) => dispatch => {
    data = formateData(data)
    api.cases().update(id, data)
        .then(res => {
            dispatch({
                type: ACTION_TYPES.UPDATE,
                payload: { id, ...data }
            })
            onSuccess()
        })
        .catch(err => console.log(err))
}

export const Delete = (id, onSuccess) => dispatch => {
    api.cases().delete(id)
        .then(res => {
            dispatch({
                type: ACTION_TYPES.DELETE,
                payload: id
            })
            onSuccess()
        })
        .catch(err => console.log(err))
}