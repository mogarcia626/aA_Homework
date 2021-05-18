import React from "react";

class Calculator extends React.Component {
    constructor(props) {
        super(props);
        this.state = { num1: '', num2: '', result: 0};
        this.setNum1 = this.setNum1.bind(this);
        this.setNum2 = this.setNum2.bind(this);
        this.addNums = this.addNums.bind(this);
        this.subtractNums = this.subtractNums.bind(this);
        this.multiplyNums = this.multiplyNums.bind(this);
        this.divideNums = this.divideNums.bind(this);
        this.clear = this.clear.bind(this);
    }

    setNum1(e) {
        const num1 = e.target.value ? parseInt(e.target.value) : '';
        this.setState({num1});
    }

    setNum2(e) {
        const num2 = e.target.value ? parseInt(e.target.value) : '';
        this.setState({ num2 });
    }

    addNums(e) {
        e.preventDefault();
        let result = this.state.num1 + this.state.num2;
        this.setState({result});
    }

    subtractNums(e) {
        e.preventDefault();
        let result = this.state.num1 - this.state.num2;
        this.setState({ result });
    }

    multiplyNums(e) {
        e.preventDefault();
        let result = this.state.num1 * this.state.num2;
        this.setState({ result });
    }

    divideNums(e) {
        e.preventDefault();
        let result = this.state.num1 / this.state.num2;
        this.setState({ result });
    }

    clear(e) {
        e.preventDefault();
        this.setState({ num1: '', num2: '', result: 0 });
    }

    render() {
        const {num1, num2, result} = this.state;
        
        return (
            <div>
                <h1>{result}</h1>
                <input onChange={this.setNum1} value={num1}/>
                <input onChange={this.setNum2} value={num2} />
                <br />
                <br />
                <button onClick={this.addNums}>+</button>
                <button onClick={this.subtractNums}>-</button>
                <button onClick={this.multiplyNums}>x</button>
                <button onClick={this.divideNums}>%</button>
                <br />
                <br />
                <button onClick={this.clear}>CLEAR</button>
            </div>
        );
    }
}

export default Calculator;