import { Grid, TextField, withStyles, FormControl, InputLabel, Select, MenuItem, Button, FormHelperText, createTheme } from "@material-ui/core";
import React, {useState,useEffect} from "react";
import useForm from "./useForm";
import { connect } from "react-redux";
import * as actions from "../actions/aCases";
import { useToasts } from "react-toast-notifications";

const theme2 = createTheme();

const styles = {

    root: {
        
            margin: theme2.spacing(3),
            padding: theme2.spacing(3),
            minWidth: 230,
        
    },

    formControl: {
        margin: theme2.spacing(1),
        minWidth: 230,
    },

    smMargin: {
        margin: theme2.spacing(1)
    }
};

const initialFieldValues = {
    names :'',
    email :'',
    age :'',
    //bmi:'',
    sex :'',
    children :'',
    smoker :'',
    region :'',
    ///cost :''
}
const CasesForm = (classes, ...props) => {

    const { addToast } = useToasts()

    const validate = (fieldValues = values) => {
        let temp = { ...errors }
        if ('names' in fieldValues)
            temp.names = fieldValues.names ? "" : "This field is required."

         if ('email' in fieldValues)
            temp.email = (/^$|.+@.+..+/).test(fieldValues.email) ? "" : "Email is not valid."

        if ('age' in fieldValues)
            temp.age = fieldValues.age ? "" : "This field is required."

       /* if ('bmi' in fieldValues) temp.bmi = fieldValues.bmi ? "" : "This field is required."*/

        if ('sex' in fieldValues)
            temp.sex = fieldValues.sex ? "" : "This field is required."

        if ('children' in fieldValues)
            temp.children = fieldValues.children ? "" : "This field is required."

        if ('smoker' in fieldValues)
            temp.smoker = fieldValues.smoker ? "" : "This field is required."

        if ('region' in fieldValues)
            temp.region = fieldValues.region ? "" : "This field is required."
       
        setErrors({
            ...temp
        })

        if (fieldValues === values)
            return Object.values(temp).every(x => x === "")
    }

    const {
        values,
        setValues,
        errors,
        setErrors,
        handleInputChange,
        resetForm
    } = useForm(initialFieldValues, validate, props.setCurrentId)

    const inputLabel = React.useRef(null);
    const [labelWidth, setLabelWidth] = React.useState(0);
    React.useEffect(() => {
        setLabelWidth(inputLabel.current.offsetWidth);
    }, []);
    const handleSubmit = e => {
        e.preventDefault()
        if (validate()) {
            const onSuccess = () => {
                resetForm()
                addToast("Submitted successfully", { appearance: 'success' })
            }
            if (props.currentId == 0)
                props.createCases(values, onSuccess)
            else
                props.updateCases(props.currentId, values, onSuccess)
        }
    }
    console.log(props.currentId);
    useEffect(() => {
        if (props.currentId !== 0) {
            setValues({
                ...props.casesList.find(x => x.id = props.currentId)
            })
            setErrors({})
        }
    }, [props.currentId])

    return ( 
        <form autoComplete="off" noValidate className={classes.root} onSubmit={handleSubmit}>
            <Grid container>
                <Grid item xs={6} className={classes.field}>
                    <TextField name="names" 
                    variant="outlined" 
                    label="Name" 
                    value={values.names} 
                    onChange={handleInputChange}
                    {...(errors.names && { error: true, helperText: errors.names })}
                    />
                    
                    <TextField 
                    name="email" 
                    variant="outlined" 
                    label="Email" 
                    value={values.email} 
                    onChange={handleInputChange}
                    {...(errors.email && { error: true, helperText: errors.email })}
                    />
                    

                    <TextField 
                    name="age" 
                    variant="outlined" 
                    label="Age" 
                    value={values.age} 
                    onChange={handleInputChange}
                    {...(errors.age && { error: true, helperText: errors.age })}
                    /> 

                   {/* <TextField 
                    name="bmi" 
                    variant="outlined" 
                    label="BMI" 
                    value={values.bmi} 
                    onChange={handleInputChange}
                    {...(errors.bmi && { error: true, helperText: errors.bmi })}
                    /> */}
                   

                    <TextField 
                    name="children" 
                    variant="outlined" 
                    label="Children" 
                    value={values.children} 
                    onChange={handleInputChange}
                    {...(errors.children && { error: true, helperText: errors.children })}
                    /> 

                    <div>
                        <Button
                            variant="contained"
                            color="primary"
                            type="submit"
                            className={classes.smMargin}
                        >
                            Submit
                        </Button>
                        <Button
                            variant="contained"
                            className={classes.smMargin}
                            onClick={resetForm}
                        >
                            Reset
                        </Button>
                    </div>
                   
                </Grid>
                <Grid xs={6}>
                    <div>sex</div>
                    <div>Smoker</div>
                    <div>Region</div>
                   <FormControl variant="outlined"
                        className={classes.formControl}
                        {...(errors.sex && { error: true })}
                    >
                        <InputLabel ref={inputLabel}>Sex</InputLabel>
                        <Select
                            name="sex"
                            value={values.sex}
                            onChange={handleInputChange}
                            labelWidth={labelWidth}
                        >
                            <MenuItem value="">Select Sex</MenuItem>
                            <MenuItem value="male">Male</MenuItem>
                            <MenuItem value="female">Female</MenuItem>
                            
                        </Select>
                        {errors.sex && <FormHelperText>{errors.sex}</FormHelperText>}
                    </FormControl>

                    <FormControl variant="outlined"
                        className={classes.formControl}
                        {...(errors.region && { error: true })}
                    >
                        <InputLabel ref={inputLabel}>Region</InputLabel>
                        <Select
                            name="region"
                            value={values.region}
                            onChange={handleInputChange}
                            labelWidth={labelWidth}
                        >
                            <MenuItem value="">Region</MenuItem>
                            <MenuItem value="southeast">SouthEast</MenuItem>
                            <MenuItem value="southwest">SouthWest</MenuItem>
                            <MenuItem value="northwest">NorthWest</MenuItem>
                            <MenuItem value="northeast">NorthEast</MenuItem>
                            
                        </Select>
                        {errors.region && <FormHelperText>{errors.region}</FormHelperText>}
                    </FormControl>

                    <FormControl variant="outlined"
                        className={classes.formControl}
                        {...(errors.smoker && { error: true })}
                    >
                        <InputLabel ref={inputLabel}>Smoker</InputLabel>
                        <Select
                            name="smoker"
                            value={values.smoker}
                            onChange={handleInputChange}
                            labelWidth={labelWidth}
                        >
                            <MenuItem value="">Smoke ?</MenuItem>
                            <MenuItem value="yes">Yes</MenuItem>
                            <MenuItem value="no">No</MenuItem>
                            
                        </Select>
                        {errors.smoker && <FormHelperText>{errors.smoker}</FormHelperText>}
                    </FormControl>

                </Grid>
            </Grid>
            </form>
    );
}

const mapStateToProps = state => ({ 
    casesList: state.rCases.list
})

const mapActionToProps = {
    createCases: actions.create,
    updateCases: actions.update
}


export default connect(mapStateToProps, mapActionToProps)(withStyles(styles)(CasesForm));