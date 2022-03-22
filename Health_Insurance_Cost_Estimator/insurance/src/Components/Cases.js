import { Grid, Paper, Table, TableBody, TableCell, TableContainer, TableHead, TableRow, createTheme, withStyles, ButtonGroup, Button  } from "@material-ui/core";
//import {  withStyles } from '@mui/styles';
import React, {useState, useEffect} from "react";
import {connect} from "react-redux";
import * as actions from "../actions/aCases";
import CasesForm from "./CasesForm";
import { useToasts } from "react-toast-notifications";
import { BsFillTrashFill } from "react-icons/bs";
import { BsFillPencilFill } from "react-icons/bs";

const theme = createTheme();
const styles = {
    root:{
        '& MuiTableCell-head':{
            fontSize:" 1.5rem "
        }

    },
    paper: {
      background: 'linear-gradient(45deg, #FE6B8B 30%, #FF8E53 90%)',
      padding: theme.spacing(3),
      margin: theme.spacing(9)
    },
  };
const Cases = ({classes, ...props}) => {
    const [currentId, setCurrentId] = useState(0)


    useEffect(()=>{
        props.festchAllCases()
    },[])

    const { addToast } = useToasts()
    const onDelete = id => {
        if (window.confirm('Are you sure to delete this record?'))
            props.deleteCases(id,()=>addToast("Deleted successfully", { appearance: 'info' }))
    }
    return ( 
        <Paper className={classes.paper} elevation={4}>
            <Grid container>
                <Grid item xs={6}>
                   <CasesForm {...({ currentId, setCurrentId })}/>
                </Grid>
                <Grid item xs={6}>
                    <TableContainer>
                        <Table>
                            <TableHead className={classes.root}>
                                <TableRow>
                                    <TableCell>Name</TableCell>
                                    <TableCell>Email</TableCell>
                                    <TableCell>Age</TableCell>
                                    {/*<TableCell>BMI</TableCell>*/}
                                    <TableCell>Sex</TableCell>
                                    <TableCell>Children</TableCell>
                                    <TableCell>Smoker</TableCell>
                                    <TableCell>Region</TableCell>
                                    <TableCell>Cost</TableCell>
                                    <TableCell></TableCell>
                                </TableRow>
                            </TableHead>
                            <TableBody>
                                {
                                   props.casesList.map((record, index)=>{
                                    
                                       return(<TableRow key={index} hover>
                                           <TableCell>{record.name}</TableCell>
                                           <TableCell>{record.email}</TableCell>
                                           <TableCell>{record.age}</TableCell>
                                           <TableCell>{record.sex}</TableCell>
                                           <TableCell>{record.children}</TableCell>
                                           <TableCell>{record.smoker}</TableCell>
                                           <TableCell>{record.region}</TableCell>
                                           <TableCell>{record.cost}</TableCell>
                                           <TableCell>
                                                <ButtonGroup variant="text">
                                                    <Button><BsFillPencilFill color="primary"
                                                        onClick={() => { setCurrentId(record.id) }} /></Button>
                                                    <Button><BsFillTrashFill color="secondary"
                                                        onClick={() => onDelete(record.id)} /></Button>
                                                </ButtonGroup>
                                            </TableCell>
                                        </TableRow>)
                                   }) 
                                }
                            </TableBody>
                        </Table>
                    </TableContainer>
                </Grid>
            </Grid>
        </Paper>
    );
}

const mapStateToProps = state => ({ 
    casesList: state.rCases.list
})
console.log(mapStateToProps);
const mapActionToProps = {

    festchAllCases : actions.fetchall,
    deleteCases: actions.Delete

}
export default connect(mapStateToProps, mapActionToProps) (withStyles(styles) (Cases));