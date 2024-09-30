import React, { useEffect, useState } from 'react';
import api from '../../services/api'; 
import { Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Paper, CircularProgress, Typography } from '@mui/material';

const InsuranceTable = () => {
  const [insuranceData, setInsuranceData] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchInsuranceData = async () => {
      try {
        const response = await api.get('/api/insurances');
        setInsuranceData(response.data);
      } catch (err) {
        setError('Failed to fetch data');
      } finally {
        setLoading(false);
      }
    };

    fetchInsuranceData();
  }, []);

  if (loading) {
    return <CircularProgress />;
  }

  if (error) {
    return <Typography color="error">{error}</Typography>;
  }

  return (
    <TableContainer component={Paper}>
      <Table>
        <TableHead>
          <TableRow>
            <TableCell>ID</TableCell>
            <TableCell>Name</TableCell>
            <TableCell>Price (cents)</TableCell>
            <TableCell>Created At</TableCell>
            <TableCell>Updated At</TableCell>
            <TableCell>Company ID</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {insuranceData?.map((insurance) => (
            <TableRow key={insurance.id}>
              <TableCell>{insurance.id}</TableCell>
              <TableCell>{insurance.name}</TableCell>
              <TableCell>{insurance.price_cents}</TableCell>
              <TableCell>{new Date(insurance.created_at).toLocaleString()}</TableCell>
              <TableCell>{new Date(insurance.updated_at).toLocaleString()}</TableCell>
              <TableCell>{insurance.company_id}</TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </TableContainer>
  );
};

export default InsuranceTable;
